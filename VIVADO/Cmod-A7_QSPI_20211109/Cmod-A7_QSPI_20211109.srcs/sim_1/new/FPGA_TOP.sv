`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/22 12:57:18
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
   
   
   localparam MODE_LEN = 4;
   localparam ID_LEN = 4;
   localparam ADDR_LEN = 8;
   localparam DATA_LEN = 8;
   localparam TX_LEN = MODE_LEN + ID_LEN + ADDR_LEN + DATA_LEN;  //-- Transaction length
   
   localparam RD_MODE = 4'b1000;
   localparam WR_MODE = 4'b0000;
   
   reg  [DATA_LEN-1:0] mem [0:2**ADDR_LEN-1];
   reg  [MODE_LEN-1:0] act_mode;   //-- 4'b1000:Read, 4'b0000:Write
   reg    [ID_LEN-1:0] tgt_id;     //-- Target board ID
   reg  [ADDR_LEN-1:0] tgt_addr;   //-- Target address
   reg  [DATA_LEN-1:0] ord_data;   //-- Order data
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
               if(tgt_id == IID) begin
                  if(act_mode == RD_MODE) nx_state = READ;
                  else if(act_mode == WR_MODE) nx_state = WRITE;
               end
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
   reg [TX_LEN-1:0] mosi_buffer;
   reg [TX_LEN-1:0] miso_buffer;
   reg r_spi_miso;
   reg r_spi_oxcs;
   
   //-- Send & receive transaction bit counter
   reg [7:0] tx_bit_cnt;
   wire tx_commit = (tx_bit_cnt == TX_LEN);
   always_ff @(posedge clk100) begin
      if(tx_commit) tx_bit_cnt <= 4'h0;
   end
   
   //-- RECV
   always_ff @(posedge clk100) begin
      if(cr_state == RECV) begin
         if(!r_spi_xcs[1] && s_spi_clk_rise) begin
            mosi_buffer <= {mosi_buffer[TX_LEN-2:0], r_spi_mosi[1]};
            tx_bit_cnt <= tx_bit_cnt + 8'h01;
         end
         
         if(tx_commit) begin
            act_mode = mosi_buffer[TX_LEN - 1 : TX_LEN - MODE_LEN];
            tgt_id = mosi_buffer[TX_LEN - MODE_LEN - 1 : TX_LEN - MODE_LEN - ID_LEN];
            tgt_addr = mosi_buffer[ADDR_LEN + DATA_LEN - 1 : DATA_LEN];
            ord_data = mosi_buffer[DATA_LEN - 1 : 0];
            
            miso_buffer = {act_mode, tgt_id, tgt_addr, ord_data};
            recv_done = 1'b1;
         end
      end
   end
   
   //-- READ
   always_ff @(posedge clk100) begin
      if(cr_state == READ) begin
         miso_buffer[DATA_LEN-1:0] <= mem[tgt_addr];
         read_done <= 1'b1;
      end
   end
   
   //-- WRITE
   always_ff @(posedge clk100) begin
      if(cr_state == WRITE) begin
         mem[tgt_addr] <= ord_data;
         write_done <= 1'b1;
      end
   end
   
   //-- SEND
   always_ff @(posedge clk100) begin
      if(cr_state == SEND) begin
         if(s_spi_oclk_rise) begin
            r_spi_oxcs <= 1'b0;
         end
         
         if(!r_spi_oxcs) begin
            if(s_spi_oclk_fall) begin
               r_spi_miso <= miso_buffer[TX_LEN-1];
               miso_buffer <= {miso_buffer[TX_LEN-2:0], 1'b0};
            end
            else if(s_spi_oclk_rise) begin
               tx_bit_cnt <= tx_bit_cnt + 8'h01;
            end
            else if(tx_commit) begin
               send_done <= 1'b1;
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
         
         tx_bit_cnt <= 8'h00;
         
         r_spi_oxcs <= 1'b1;
         r_spi_miso <= 1'b0;
         
         init_done <= 1'b1;
      end
   end
   
   assign OSPI_CLK = r_spi_oclk;
   assign OSPI_XCS = r_spi_oxcs;
   assign OSPI_MISO = r_spi_miso;
endmodule
