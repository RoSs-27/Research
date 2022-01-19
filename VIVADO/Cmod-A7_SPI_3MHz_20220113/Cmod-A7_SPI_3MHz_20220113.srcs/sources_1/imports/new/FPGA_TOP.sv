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
   input wire ISPI_CLK, //-- 3MHz
   input wire ISPI_MOSI,
   input wire ISPI_XCS,
   output wire OSPI_CLK,
   output wire OSPI_MISO,
   output wire OSPI_XCS,
   //-- system
   input         ICLK,   //-- 12 MHz
   input         IRST,
   input   [3:0] IID,    //-- Board ID
   output        LED,
   output [10:0] ODATA_A,
   output [10:0] ODATA_B,
   output [10:0] ODATA_C
   //-- debug
   //output [7:0] OSTATE
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
   reg  rst;
   wire clk100;
   wire s_locked;

   CLKGEN clkgen ( 
      .ICLK12MHZ (ICLK), 
      .OCLK100MHZ (clk100), 
      //.resetn(1'b1),
      .OLOCKED(s_locked)
   );
   
   CHAT_CHK_BTN rst_btn (
       .ICLK(ICLK),
       .IBTN(IRST | ~s_locked),
       .OBTN(rst)
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
  
  
   //-- SPI buffer
   reg [TX_LEN-1:0] mosi_buffer;
   reg [TX_LEN-1:0] miso_buffer;
   reg r_spi_miso;
   reg r_spi_oxcs;
   reg [7:0] return_byte; 
   
   //-- Send & receive transaction bit counter
   reg [7:0] tx_bit_cnt;
   reg [7:0] tx_byte_cnt;
   //wire tx_commit = (tx_bit_cnt == TX_LEN);
   wire rx_commit = (tx_byte_cnt == 8'd2) && (tx_bit_cnt == 8'd7);
   wire tx_commit = (tx_byte_cnt == 8'd3) && (tx_bit_cnt == 8'd7);
   
   always_ff @(posedge clk100) begin
      if(r_spi_xcs[1])  tx_bit_cnt <= 8'd0;
      else begin
         if(s_spi_clk_rise) begin
             tx_bit_cnt <= (tx_bit_cnt==8'd7) ? 8'd0 : (tx_bit_cnt + 8'd1);
         end
      end
   end
   
   always_ff @(posedge clk100) begin
      if (r_spi_xcs[1]) tx_byte_cnt <= 8'd0;
      else if (s_spi_clk_rise) begin
         if (tx_bit_cnt == 8'd7) tx_byte_cnt <= tx_byte_cnt + 8'd1;
      end
   end
   
   
   //-- Receive data
   always_ff @(posedge clk100) begin
      if(!r_spi_xcs[1] && s_spi_clk_rise) begin
         mosi_buffer <= {mosi_buffer[TX_LEN-2:0], r_spi_mosi[1]};  //-- shift in from LSB.      
      end
   end
   
   
   //-- Store data
   always_ff @(posedge clk100) begin
      if (!r_spi_xcs[1] && s_spi_clk_rise) begin
         if ((tx_byte_cnt==8'd0) && (tx_bit_cnt==8'd7)) begin //-- 1st byte end.
            act_mode <= mosi_buffer[6:3];
            tgt_id   <= {mosi_buffer[2:0], r_spi_mosi[1]}; 
         end
         else if ((tx_byte_cnt==8'd1) && (tx_bit_cnt==8'd7)) begin //-- 2nd byte end.
            tgt_addr <= {mosi_buffer[6:0], r_spi_mosi[1]};
         end
         else if ((tx_byte_cnt==8'd2) && (tx_bit_cnt==8'd7)) begin //-- 3rd byte end.
            ord_data <= {mosi_buffer[6:0], r_spi_mosi[1]};
         end
      end
      if (tx_byte_cnt==8'd3) begin
         act_mode <= 4'h0;
         tgt_id <= 4'h0;
         tgt_addr <= 8'h00;
         ord_data <= 8'h00;
      end
   end
   
   //-- write a byte to register.
   always_ff @(posedge clk100) begin
      if (!r_spi_xcs[1] && s_spi_clk_rise) begin
         if ((tx_byte_cnt==8'd2) && (tx_bit_cnt==8'd7)) begin
            if ((act_mode == WR_MODE) && (tgt_id == IID)) begin
               mem[tgt_addr] <= {mosi_buffer[6:0], r_spi_mosi[1]}; //ord_data; //-- write a byte to register.
            end
         end
      end
   end
      
   always_ff @(posedge clk100) begin
      if (r_spi_xcs[1]) return_byte <= 8'h0;
      else begin
         if ((tx_byte_cnt==8'd2) && s_spi_clk_fall) begin
            if (tx_bit_cnt==8'd0) begin
               if ((act_mode == RD_MODE) && (tgt_id == IID)) begin
                  return_byte <= mem[tgt_addr];
               end
            end
            else begin
               return_byte <= {return_byte[6:0], 1'b0}; //-- shift left.
            end
         end
      end
   end
   
   wire parry_enable = !((act_mode == RD_MODE) && (tgt_id == IID)) || (tx_byte_cnt <= 8'd1);
   always_comb begin
      if(parry_enable) r_spi_miso = r_spi_mosi[1];
      else             r_spi_miso = return_byte[7];
   end
   
   //-- assign
   assign OSPI_CLK = r_spi_clk;
   assign OSPI_XCS = r_spi_xcs[1];
   assign OSPI_MISO = r_spi_miso;
//   assign OSPI_MISO = return_byte[7];
   
   
   //-- Debug
   //assign ODATA_A[7:0] = cr_state;
   assign ODATA_A[3:0] = IID;
   assign ODATA_B[7:0] = {act_mode, tgt_id};
   assign ODATA_C[7:0] = mem[0];
   
   reg r_spi_clk_d2;
   always_ff @(posedge r_spi_clk) begin
      r_spi_clk_d2 <= ~r_spi_clk_d2;
   end
   assign ODATA_C[8] = r_spi_clk_d2;
   assign ODATA_C[9] = (IID == tgt_id);
   
   reg led;
   always_ff @(posedge clk100) begin
      if(rst) led <= 1'b0;
      else    led <= 1'b1;
   end
   assign LED = led;
endmodule
