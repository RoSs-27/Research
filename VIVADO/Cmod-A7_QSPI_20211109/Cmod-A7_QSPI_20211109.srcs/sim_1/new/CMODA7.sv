`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/12 17:15:03
// Design Name: 
// Module Name: CMODA7
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

module CMODA7(
   //-- SPI slave
   input  ISPI_CLK,
   input  ISPI_MOSI,
   input  ISPI_XCS,
   output OSPI_CLK,
   output OSPI_MISO,
   output OSPI_XCS,
   //-- Speaker 3 set
   output [10:0] OSP_A,
   output [10:0] OSP_B,
   output [10:0] OSP_C
   );
   parameter delay = 8'd0;
   parameter ID = 4'b0000;
    
   logic clk_xtal;
   logic rst;
    
   FPGA_TOP fpga_top(
      //-- SPI slave
      .ISPI_CLK(ISPI_CLK),
      .ISPI_MOSI(ISPI_MOSI),
      .ISPI_XCS(ISPI_XCS),
      .OSPI_CLK(OSPI_CLK),
      .OSPI_MISO(OSPI_MISO),
      .OSPI_XCS(OSPI_XCS),
      //-- system
      .ICLK(clk_xtal),
      .IRST(rst),
      .IID(ID),
      .ODATA_A(),
      .ODATA_B(),
      .ODATA_C()
   );
    
   //-- 12 MHz x'tal clock
   initial begin
      #(delay);
      forever begin
         clk_xtal = 1'b0;    #41.666;
         clk_xtal = 1'b1;    #41.666;
      end
   end
   
   initial begin
           rst = 1'b1;
      #50  rst = 1'b0;
      #500 rst = 1'b1;
   end
endmodule