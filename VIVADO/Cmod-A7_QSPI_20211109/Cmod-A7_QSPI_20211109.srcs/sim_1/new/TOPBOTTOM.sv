`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/12 17:15:51
// Design Name: 
// Module Name: TOPBOTTOM
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


module TOPBOTTOM(
   //-- PC interface
   input ITOP_SPI_CLK,
   input ITOP_SPI_MOSI,
   input ITOP_SPI_XCS,
   output OTOP_SPI_MISO,
   //
   input IBOT_SPI_CLK,
   input IBOT_SPI_MOSI,
   input IBOT_SPI_XCS,
   output OBOT_SPI_MISO
   );
    
   //-- top side speaker wire
   wire [10:0] top_sp0;
   wire [10:0] top_sp1;
   wire [10:0] top_sp2; 
   wire [10:0] top_sp3;
   wire [10:0] top_sp4;
   wire [10:0] top_sp5;
   wire [10:0] top_sp6;
   wire [10:0] top_sp7;
   wire [10:0] top_sp8;
   wire [10:0] top_sp9;
   wire [10:0] top_spA;
   wire [10:0] top_spB;
   //-- bottom side speaker wire
   wire [10:0] bot_sp0;
   wire [10:0] bot_sp1;
   wire [10:0] bot_sp2;
   wire [10:0] bot_sp3;
   wire [10:0] bot_sp4;
   wire [10:0] bot_sp5;
   wire [10:0] bot_sp6;
   wire [10:0] bot_sp7;
   wire [10:0] bot_sp8;
   wire [10:0] bot_sp9;
   wire [10:0] bot_spA;
   wire [10:0] bot_spB;
   
   //-- daisychain connection
   wire top_spi_clk_0to1;
   wire top_spi_clk_1to2;
   wire top_spi_clk_2to3;
   wire bot_spi_clk_0to1;
   wire bot_spi_clk_1to2;
   wire bot_spi_clk_2to3;
   //
   wire top_spi_xcs_0to1;
   wire top_spi_xcs_1to2;
   wire top_spi_xcs_2to3;
   wire bot_spi_xcs_0to1;
   wire bot_spi_xcs_1to2;
   wire bot_spi_xcs_2to3;
   //
   wire top_spi_data_0to1;
   wire top_spi_data_1to2;
   wire top_spi_data_2to3;
   wire bot_spi_data_0to1;
   wire bot_spi_data_1to2;
   wire bot_spi_data_2to3;
   
   
   //-- Cmod A7 board (Top side)
   CMODA7 #(.delay(8'h55), .ID(4'b0000)) cmod_t0 (  //-- Master
      .ISPI_CLK(ITOP_SPI_CLK),
      .ISPI_MOSI(ITOP_SPI_MOSI),
      .ISPI_XCS(ITOP_SPI_XCS),
      .OSPI_CLK(top_spi_clk_0to1),
      .OSPI_MISO(top_spi_data_0to1),
      .OSPI_XCS(top_spi_xcs_0to1),
      .OSP_A(top_sp0),
      .OSP_B(top_sp1),
      .OSP_C(top_sp2)
   );
    
   CMODA7 #(.delay(8'hA8), .ID(4'b0001)) cmod_t1 (
      .ISPI_CLK(top_spi_clk_0to1),
      .ISPI_MOSI(top_spi_data_0to1),
      .ISPI_XCS(top_spi_xcs_0to1),
      .OSPI_CLK(top_spi_clk_1to2),
      .OSPI_MISO(top_spi_data_1to2),
      .OSPI_XCS(top_spi_xcs_1to2),
      .OSP_A(top_sp3),
      .OSP_B(top_sp4),
      .OSP_C(top_sp5)
   );
    
   CMODA7 #(.delay(8'h18), .ID(4'b0010)) cmod_t2 (
      .ISPI_CLK(top_spi_clk_1to2),
      .ISPI_MOSI(top_spi_data_1to2),
      .ISPI_XCS(top_spi_xcs_1to2),
      .OSPI_CLK(top_spi_clk_2to3),
      .OSPI_MISO(top_spi_data_2to3),
      .OSPI_XCS(top_spi_xcs_2to3),
      .OSP_A(top_sp6),
      .OSP_B(top_sp7),
      .OSP_C(top_sp8)
   );
    
   CMODA7 #(.delay(8'h60), .ID(4'b0011)) cmod_t3 (
      .ISPI_CLK(top_spi_clk_2to3),
      .ISPI_MOSI(top_spi_data_2to3),
      .ISPI_XCS(top_spi_xcs_2to3),
      .OSPI_CLK(),
      .OSPI_MISO(OTOP_SPI_MISO),
      .OSPI_XCS(),
      .OSP_A(top_sp9),
      .OSP_B(top_spA),
      .OSP_C(top_spB)
   );
    
   //-- Cmod A7 board (Bottom side)
   CMODA7 #(.delay(8'hBB), .ID(4'b0100)) cmod_b0 (
      .ISPI_CLK(IBOT_SPI_CLK),
      .ISPI_MOSI(IBOT_SPI_MOSI),
      .ISPI_XCS(IBOT_SPI_XCS),
      .OSPI_CLK(bot_spi_clk_0to1),
      .OSPI_MISO(bot_spi_data_0to1),
      .OSPI_XCS(bot_spi_xcs_0to1),
      .OSP_A(bot_sp0),
      .OSP_B(bot_sp1),
      .OSP_C(bot_sp2)
   );
    
   CMODA7 #(.delay(8'h08), .ID(4'b0101)) cmod_b1 (
      .ISPI_CLK(bot_spi_clk_0to1),
      .ISPI_MOSI(bot_spi_data_0to1),
      .ISPI_XCS(bot_spi_xcs_0to1),
      .OSPI_CLK(bot_spi_clk_1to2),
      .OSPI_MISO(bot_spi_data_1to2),
      .OSPI_XCS(bot_spi_xcs_1to2),
      .OSP_A(bot_sp3),
      .OSP_B(bot_sp4),
      .OSP_C(bot_sp5)
   );
    
   CMODA7 #(.delay(8'h3F), .ID(4'b0110)) cmod_b2 (
      .ISPI_CLK(bot_spi_clk_1to2),
      .ISPI_MOSI(bot_spi_data_1to2),
      .ISPI_XCS(bot_spi_xcs_1to2),
      .OSPI_CLK(bot_spi_clk_2to3),
      .OSPI_MISO(bot_spi_data_2to3),
      .OSPI_XCS(bot_spi_xcs_2to3),
      .OSP_A(bot_sp6),
      .OSP_B(bot_sp7),
      .OSP_C(bot_sp8)
   );

   CMODA7 #(.delay(8'hA1), .ID(4'b0111)) cmod_b3 (
      .ISPI_CLK(bot_spi_clk_2to3),
      .ISPI_MOSI(bot_spi_data_2to3),
      .ISPI_XCS(bot_spi_xcs_2to3),
      .OSPI_CLK(),
      .OSPI_MISO(OBOT_SPI_MISO),
      .OSPI_XCS(),
      .OSP_A(bot_sp9),
      .OSP_B(bot_spA),
      .OSP_C(bot_spB)
   );
    
        
   /*
   //-- Cmod A7 board (Top side)
   CMODA7 #(.delay(8'h55)) cmod_t0 (  //-- Master
      .ISPI_CLK(ITOP_SPI_CLK),
      .ISPI_MOSI(ITOP_SPI_MOSI),
      .ISPI_XCS(ITOP_SPI_XCS),
      .OSPI_MISO(OTOP_SPI_MISO),
      .OSP_A(top_sp0),
      .OSP_B(top_sp1),
      .OSP_C(top_sp2)
   );
    
   CMODA7 #(.delay(8'hA8)) cmod_t1 (
      .ISPI_CLK(ITOP_SPI_CLK),
      .ISPI_MOSI(ITOP_SPI_MOSI),
      .ISPI_XCS(ITOP_SPI_XCS),
      .OSPI_MISO(OTOP_SPI_MISO),
      .OSP_A(top_sp3),
      .OSP_B(top_sp4),
      .OSP_C(top_sp5)
   );
    
   CMODA7 #(.delay(8'h18)) cmod_t2 (
      .ISPI_CLK(ITOP_SPI_CLK),
      .ISPI_MOSI(ITOP_SPI_MOSI),
      .ISPI_XCS(ITOP_SPI_XCS),
      .OSPI_MISO(OTOP_SPI_MISO),
      .OSP_A(top_sp6),
      .OSP_B(top_sp7),
      .OSP_C(top_sp8)
   );
    
   CMODA7 #(.delay(8'h60)) cmod_t3 (
      .ISPI_CLK(ITOP_SPI_CLK),
      .ISPI_MOSI(ITOP_SPI_MOSI),
      .ISPI_XCS(ITOP_SPI_XCS),
      .OSPI_MISO(OTOP_SPI_MISO),
      .OSP_A(top_sp9),
      .OSP_B(top_spA),
      .OSP_C(top_spB)
   );
    
   //-- Cmod A7 board (Bottom side)
   CMODA7 #(.delay(8'hBB)) cmod_b0 (
      .ISPI_CLK(IBOT_SPI_CLK),
      .ISPI_MOSI(IBOT_SPI_MOSI),
      .ISPI_XCS(IBOT_SPI_XCS),
      .OSPI_MISO(OBOT_SPI_MISO),
      .OSP_A(bot_sp0),
      .OSP_B(bot_sp1),
      .OSP_C(bot_sp2)
   );
    
   CMODA7 #(.delay(8'h08)) cmod_b1 (
      .ISPI_CLK(IBOT_SPI_CLK),
      .ISPI_MOSI(IBOT_SPI_MOSI),
      .ISPI_XCS(IBOT_SPI_XCS),
      .OSPI_MISO(OBOT_SPI_MISO),
      .OSP_A(bot_sp3),
      .OSP_B(bot_sp4),
      .OSP_C(bot_sp5)
   );
    
   CMODA7 #(.delay(8'h3F)) cmod_b2 (
      .ISPI_CLK(IBOT_SPI_CLK),
      .ISPI_MOSI(IBOT_SPI_MOSI),
      .ISPI_XCS(IBOT_SPI_XCS),
      .OSPI_MISO(OBOT_SPI_MISO),
      .OSP_A(bot_sp6),
      .OSP_B(bot_sp7),
      .OSP_C(bot_sp8)
   );
    
   CMODA7 #(.delay(8'hA1)) cmod_b3 (
      .ISPI_CLK(IBOT_SPI_CLK),
      .ISPI_MOSI(IBOT_SPI_MOSI),
      .ISPI_XCS(IBOT_SPI_XCS),
      .OSPI_MISO(OBOT_SPI_MISO),
      .OSP_A(bot_sp9),
      .OSP_B(bot_spA),
      .OSP_C(bot_spB)
   );
   */
endmodule
