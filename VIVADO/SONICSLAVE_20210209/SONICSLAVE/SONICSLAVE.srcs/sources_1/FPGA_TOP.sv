//                              -*- Mode: Verilog -*-
// Filename        : FPGA_TOP.sv
// Description     : 
// Author          : 
// Created On      : Mon Jan 11 22:13:48 2021
// Last Modified By: 
// Last Modified On: 2021-02-03 17:50:21
// Update Count    : 0
// Status          : Unknown, Use with caution!
`include "USER_DEFINES.vh"

module FPGA_TOP (
   input wire  ISPI_SCLK,
   input wire  ISPI_XCS,
   input wire  ISPI_MOSI,
   output wire OSPI_MISO,
   input wire  ISYSCLK   
   );

   wire clkgen_locked;
   wire clk10, clk100, locked;
   wire rst10, rst100;

   wire [7:0] wraddr, rdaddr, rddata, wrdata;
   wire       we, re;

   intf_SPI intf_spi();
   assign intf_spi.SCLK = ISPI_SCLK;
   assign intf_spi.XCS  = ISPI_XCS;
   assign intf_spi.MOSI = ISPI_MOSI;
   assign intf_spi.MISO = OSPI_MISO;

   SLAVE_TOP slave_top 
     (
      .SPI_slave(intf_spi),
      .IRST(rst100),
      .ICLK(clk100)
      );

   MCU_wrapper mcu_wrapper (
      .OCLK100(clk100),      .ORST100(rst100),
      .OCLK10(clk10),
      .OLOCKED(locked),
      .ISYSRST(),
      .ISYSCLK(ISYSCLK)
   );

endmodule // FPGA_TOP

