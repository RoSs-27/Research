//                              -*- Mode: Verilog -*-
// Filename        : SLAVE_TOP.sv
// Description     : 
// Author          : 
// Created On      : Wed Feb  3 12:11:24 2021
// Last Modified By: 
// Last Modified On: 2021-02-03 18:28:23
// Update Count    : 0
// Status          : Unknown, Use with caution!
`include "USER_DEFINES.vh"

module SLAVE_TOP (
   input wire        ICLK,
   input wire        IRST,
   intf_SPI.slv      SPI_slave
   );

   wire [7:0] waddr, raddr, rdata, wdata;
   wire       we, re;

   //-- Interface definitions.
   intf_REGI intf_regi();

   SPI_SLAVE spi_slave (
      .SPI_slave(SPI_slave),
      .REGI_master(intf_regi),  //---> "regi_top"
      //-- system ports
      .ICLK(ICLK),  .IRST(IRST)
   );
   
   wire [7:0] s_reg[0:255];
   
   REGI_TOP regi_top (
      //-- REGI ports
      .REGI_slave(intf_regi),  //<--- "spi_slave"
      .OREG(s_reg), //[0:255][7:0]
      .ICLK(ICLK)
   );
endmodule // SLAVE_TOP

