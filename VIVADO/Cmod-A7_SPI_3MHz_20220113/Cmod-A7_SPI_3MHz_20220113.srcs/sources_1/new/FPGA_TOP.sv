`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 18:18:40
// Design Name: 
// Module Name: FPGA_TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FPGA_TOP(
   //-- SPI slave
   input wire ISPI_CLK, //-- 10MHz
   input wire ISPI_MOSI,
   input wire ISPI_XCS,
   output reg OSPI_CLK,
   output reg OSPI_MISO,
   output reg OSPI_XCS,
   //-- system
   input         ICLK,   //-- 12 MHz
   input         IRST,
   input   [3:0] IID,    //-- Board ID
   output [10:0] ODATA_A,
   output [10:0] ODATA_B,
   output [10:0] ODATA_C
   );

   localparam MODE_LENGTH = 4;
   localparam ID_LENGTH = 4;
   localparam ADDR_LENGTH = 8;
   localparam DATA_LENGTH = 8;
   
   localparam ORD_LEN = MODE_LENGTH + ID_LENGTH + ADDR_LENGTH;    //-- Order length
   localparam TX_LEN = ORD_LEN + DATA_LENGTH;  //-- Transaction length
   
   localparam RD_MODE = 4'b1000;
   localparam WR_MODE = 4'b0000;
       
   reg  [DATA_LENGTH-1:0] mem [0:2**ADDR_LENGTH-1];
   reg  [MODE_LENGTH-1:0] i_mode;   //-- 4'b1000:Read, 4'b0000:Write
   reg    [ID_LENGTH-1:0] i_id;
   reg  [ADDR_LENGTH-1:0] i_addr;
   reg  [DATA_LENGTH-1:0] i_data;
   wire clk100;
   wire s_locked;

   CLKGEN clkgen ( 
     .ICLK12MHZ (ICLK), 
     .OCLK100MHZ (clk100), 
     //.resetn(1'b1),
     .OLOCKED(s_locked)
   );

   //-- SPI
   reg [2:0] r_spi_clk;
   always_ff @(posedge clk100) begin
      r_spi_clk <= {r_spi_clk[1:0], ISPI_CLK};
   end
   wire s_spi_clk_rise = (r_spi_clk[2:1]==2'b01);
   wire s_spi_clk_fall = (r_spi_clk[2:1]==2'b10);
    
   reg [2:0] r_spi_xcs;
   always_ff @(posedge clk100) begin
      r_spi_xcs <= {r_spi_xcs[1:0], ISPI_XCS};
   end
   wire s_spi_xcs_rise = (r_spi_xcs[2:1]==2'b01);
   wire s_spi_xcs_fall = (r_spi_xcs[2:1]==2'b10);
    
   reg [2:0] r_spi_mosi;
   always_ff @(posedge clk100) begin
      r_spi_mosi <= {r_spi_mosi[1:0], ISPI_MOSI};
   end
   
   reg r_spi_oclk;
   reg [3:0] r_spi_clkdiv;
   wire s_spi_oclk_rise = (r_spi_clkdiv == 4'd9);
   wire s_spi_oclk_fall = (r_spi_clkdiv == 4'd4);
   always @ (posedge clk100) begin
      if(!IRST) r_spi_clkdiv <= 4'd0;
      else if (r_spi_clkdiv > 4'd8) r_spi_clkdiv <= 4'd0;
      else      r_spi_clkdiv <= r_spi_clkdiv + 4'd1;
   end
   always @ (posedge clk100) begin
      if (!IRST) r_spi_oclk <= 1'b1;
      else if (s_spi_oclk_fall) r_spi_oclk <= 1'b0;
      else if (s_spi_oclk_rise) r_spi_oclk <= 1'b1;
   end   
   
   
   //-- State parameter
   localparam IDLE  = 4'h0;
   localparam RECV  = 4'h1;
   localparam READ  = 4'h2;
   localparam WRITE = 4'h3;
   localparam SEND  = 4'h4;
   localparam INIT  = 4'hF;
   
   //-- State machine
   reg [3:0] cr_state;   //-- Current state
   reg [3:0] nx_state;   //-- Next state
   reg recv_done;
   reg read_done;
   reg write_done;
   reg send_done;
   reg init_done;

   always_ff @(posedge clk100) begin
      if(!IRST) cr_state <= INIT;
      else      cr_state <= nx_state;
   end

   always_comb begin
      nx_state = cr_state;
      case(cr_state)
         IDLE : begin
            if(s_spi_xcs_fall) nx_state = RECV;
         end
         RECV : begin
            if(recv_done) begin               
               if(i_id == IID && i_mode == RD_MODE) nx_state = READ;
               else if(i_id == IID && i_mode == WR_MODE) nx_state = WRITE;
               else nx_state = SEND;
            end
         end
         READ : begin
            if(read_done) nx_state = SEND;
         end
         WRITE : begin
            if(write_done) nx_state = SEND;
         end
         SEND : begin
            if(send_done) nx_state = INIT;
         end
         INIT : begin
            if(init_done) begin
               init_done = 1'b0;
               nx_state = IDLE;
            end
         end
      endcase
   end
   
   
   //-- SPI buffer
   reg [7:0] mosi_shift;
   reg [7:0] miso_shift;
   reg r_spi_miso;
   reg r_spi_oxcs;
   reg r_spi_oxcs_sw;
   
   //-- Send & receive bit counter
   reg [3:0] recv_bit_cnt;
   reg [3:0] send_bit_cnt;
   wire arrive_byte = (recv_bit_cnt == 4'h8);
   wire leave_byte = (send_bit_cnt == 4'h8);
   always_ff @(posedge clk100) begin
      if(arrive_byte) recv_bit_cnt <= 4'h0;
      if(leave_byte)  send_bit_cnt <= 4'h0;
   end
   
   reg [1:0] arrive_byte_cnt;
   always_ff @(posedge clk100) begin
      if(arrive_byte && arrive_byte_cnt < 2'b11)
            arrive_byte_cnt <= arrive_byte_cnt + 2'b01;
   end

   
   //-- Send & receive step check flag
   reg write_step;
   reg [2:0] send_step;
   wire data_parry = !(read_done | write_done);
   
   //-- Send & receive data
   always_ff @(posedge clk100) begin
      if(cr_state == RECV || cr_state == READ || cr_state == WRITE) begin
         if(!r_spi_xcs[1] && s_spi_clk_rise) begin
            mosi_shift <= {mosi_shift[6:0], r_spi_mosi[1]};
            recv_bit_cnt <= recv_bit_cnt + 4'h1;
         end
      end
   end
   
   always_ff @(posedge clk100) begin
      if(cr_state == SEND) begin
         if(!r_spi_xcs[1] && s_spi_clk_rise) begin
            if(data_parry && arrive_byte_cnt < 2'b11) begin
               mosi_shift <= {mosi_shift[6:0], r_spi_mosi[1]};  
               recv_bit_cnt <= recv_bit_cnt + 4'h1;
            end
         end
         
         if(!r_spi_oxcs) begin
            if(s_spi_oclk_fall) begin
               r_spi_miso <= miso_shift[7];
               miso_shift <= {miso_shift[6:0], 1'b0};
            end
            if(s_spi_oclk_rise) begin
               send_bit_cnt <= send_bit_cnt + 4'h1;
            end
         end
      end
   end
      
   //-- INIT
   always_ff @(posedge clk100) begin
      if(cr_state == INIT) begin
         recv_done <= 1'b0;
         read_done <= 1'b0;
         write_done <= 1'b0;
         send_done <= 1'b0;
         
         recv_bit_cnt <= 4'h0;
         send_bit_cnt <= 4'h0;
         arrive_byte_cnt <= 2'b00;
         
         write_step <= 1'b0;
         send_step <= 3'b000;
         
//         r_spi_oxcs <= 1'b1;
         r_spi_oxcs_sw <= 1'b1;
         r_spi_miso <= 1'b0;
         
         init_done <= 1'b1;
      end
   end
   
   //-- RECV
   always_ff @(posedge clk100) begin
      if(cr_state == RECV) begin
         if(arrive_byte) begin
            i_mode <= mosi_shift[7:4];
            i_id <= mosi_shift[3:0];
//            r_spi_oxcs <= 1'b1;
            recv_done <= 1'b1;
         end
      end
   end
   
   //-- READ
   always_ff @(posedge clk100) begin
      if(cr_state == READ) begin
         if(arrive_byte) begin
            i_addr <= mosi_shift;
            i_data <= mem[mosi_shift];
            read_done <= 1'b1;
         end
      end
   end
   
   //-- WRITE
   always_ff @(posedge clk100) begin
      if(cr_state == WRITE) begin
         if(arrive_byte) begin
            case(write_step)
               1'b0: begin
                  i_addr <= mosi_shift;
               end
               1'b1: begin
                  i_data <= mosi_shift;
                  mem[i_addr] <= mosi_shift;
                  write_done <= 1'b1;
               end
               default: begin end
            endcase
            
            write_step <= write_step + 1'b1;
         end
      end
   end
   
   //-- SEND   
   always_ff @(posedge clk100) begin
      if(cr_state == SEND) begin
         if(s_spi_oclk_rise) r_spi_oxcs <= 1'b0;

         if(!r_spi_oxcs) begin
            if(leave_byte) send_step <= send_step + 3'b001;
            case(send_step)
               3'b000: begin
                  miso_shift <= {i_mode, i_id};
                  send_step <= send_step + 3'b001;
               end
               3'b010: begin
                  miso_shift <= (data_parry) ? mosi_shift : i_addr;
                  send_step <= send_step + 3'b001;
               end
               3'b100: begin
                  miso_shift <= (data_parry) ? mosi_shift : i_data;
                  send_step <= send_step + 3'b001;
               end
               3'b110: send_done <= 1'b1;
            endcase
         end
      end
   end
   
   //-- IDLE
   localparam OXCS_WAIT_TIME = 8;
   reg [7:0] r_spi_oxcs_wait_cnt;
   always_ff @(posedge clk100) begin
      if(!IRST) r_spi_oxcs_wait_cnt <= 8'h00;
      else if(cr_state == IDLE && s_spi_clk_rise && r_spi_oxcs_sw) begin
         if(r_spi_oxcs_wait_cnt > OXCS_WAIT_TIME) begin
            r_spi_oxcs_wait_cnt <= 8'h00;
            r_spi_oxcs_sw <= 1'b0;
            r_spi_oxcs <= 1'b1;
         end
         else
            r_spi_oxcs_wait_cnt <= r_spi_oxcs_wait_cnt + 8'h01;
      end
   end
   
   

   /*
   //-- Input data
   reg [TX_LEN-1:0] mosi_shift;
   reg [TX_LEN-1:0] miso_shift;
   reg r_spi_miso;
   reg allow_recv;
   reg allow_send;   
   
   always @(posedge clk100) begin
      if(s_spi_xcs_fall) begin
         allow_recv <= 1'b1;
         allow_send <= 1'b0;
      end
   end
   
   always @(posedge clk100) begin
      if(!r_spi_xcs[1] && s_spi_clk_rise) begin
         mosi_shift <= {mosi_shift[TX_LEN-2:0], r_spi_mosi[1]};
      end
      else if(s_spi_xcs_rise) begin
         i_mode <= mosi_shift[TX_LEN - 1 : TX_LEN - MODE_LENGTH];
         i_id <= mosi_shift[TX_LEN - MODE_LENGTH - 1 : TX_LEN - MODE_LENGTH - ID_LENGTH];
         i_addr <= mosi_shift[ADDR_LENGTH + DATA_LENGTH - 1 : DATA_LENGTH];
         i_data <= mosi_shift[DATA_LENGTH - 1 : 0];
         allow_recv <= 1'b0;
      end
   end
   
   always @(posedge clk100) begin
      if(!allow_recv && !allow_send) begin
         if(IID == i_id) begin   //-- Board ID match
            if(i_mode == W_MODE) begin   //-- Write mode
               mem[i_addr] <= i_data;
            end
            else if(i_mode == R_MODE) begin   //-- Read mode
               miso_shift <= {i_mode, i_id, i_addr, mem[i_addr]};
               allow_send <= 1'b1;
            end
         end
         else begin   //-- Board ID mismatch
            miso_shift <= {i_mode, i_id, i_addr, i_data};
            allow_send <= 1'b1;
         end
         allow_recv <= 1'b1;
      end
   end
   
   always @(posedge clk100) begin
      if(allow_send) begin
         if(!r_spi_xcs[1] && s_spi_clk_rise) begin
            miso_shift <= {miso_shift[TX_LEN-2:0], 1'b0};
            r_spi_miso <= miso_shift[TX_LEN-1];
         end
         else if(s_spi_xcs_rise) begin
            allow_send <= 1'b0;
         end
      end
   end
   */
  
//   //-- Input data
//   reg [TX_LEN-1:0] mosi_shift;
//   reg w_spi_miso;
//   always @(posedge clk100) begin
//      if (!r_spi_xcs[1] && s_spi_clk_rise) begin
//         mosi_shift <= {mosi_shift[TX_LEN-2:0], r_spi_mosi[1]};
//         r_spi_miso <= mosi_shift[TX_LEN-1];
//      end
//      else if (s_spi_xcs_rise) begin
//         i_mode = mosi_shift[TX_LEN - 1 : TX_LEN - MODE_LENGTH];
//         i_id = mosi_shift[TX_LEN - MODE_LENGTH - 1 : TX_LEN - MODE_LENGTH - ID_LENGTH];
//         i_addr = mosi_shift[ADDR_LENGTH + DATA_LENGTH - 1 : DATA_LENGTH];
//         i_data = mosi_shift[DATA_LENGTH - 1 : 0];
//         mem[i_addr] = i_data;
//      end
//   end

  
   assign OSPI_CLK = r_spi_oclk;
   assign OSPI_XCS = r_spi_oxcs;
   assign OSPI_MISO = r_spi_miso;
endmodule
