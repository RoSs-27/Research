`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 16:35:15
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb();

   wire s_host0_spi_clk;
   wire s_host0_spi_mosi;
   wire s_host0_spi_xcs;
   wire s_host0_spi_miso;
   
   wire s_host1_spi_clk;
   wire s_host1_spi_mosi;
   wire s_host1_spi_xcs;
   wire s_host1_spi_miso;
   
  //-- PC host SPI
  HOST_SPI host0_spi(
     .OSPI_CLK(s_host0_spi_clk),
     .OSPI_MOSI(s_host0_spi_mosi),
     .OSPI_XCS(s_host0_spi_xcs),
     .ISPI_MISO(s_host0_spi_miso)
  );
  HOST_SPI host1_spi(
     .OSPI_CLK(s_host1_spi_clk),
     .OSPI_MOSI(s_host1_spi_mosi),
     .OSPI_XCS(s_host1_spi_xcs),
     .ISPI_MISO(s_host1_spi_miso)
  );
   
  //-- Volume display cont.
  TOPBOTTOM topbottom (
     .ITOP_SPI_CLK(s_host0_spi_clk),
     .ITOP_SPI_MOSI(s_host0_spi_mosi),
     .ITOP_SPI_XCS(s_host0_spi_xcs),
     .OTOP_SPI_MISO(s_host0_spi_miso),
  //
     .IBOT_SPI_CLK(s_host1_spi_clk),
     .IBOT_SPI_MOSI(s_host1_spi_mosi),
     .IBOT_SPI_XCS(s_host1_spi_xcs),
     .OBOT_SPI_MISO(s_host1_spi_miso)
  );

endmodule
