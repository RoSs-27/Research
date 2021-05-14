//                              -*- Mode: Verilog -*-
// Filename        : REG_TOP.sv
// Description     : 
// Author          : 
// Created On      : Tue Jan 12 20:04:44 2021
// Last Modified By: 
// Last Modified On: 2021-02-03 18:16:54
// Update Count    : 0
// Status          : Unknown, Use with caution!
`include "USER_DEFINES.vh"

module REGI_TOP (
   output reg [7:0] OREG[0:255],
   input wire       ICLK,
   //-- FIFO interface.
   intf_REGI.slv  REGI_slave
   );
   wire [7:0] IWADDR = REGI_slave.IWADDR;
   wire [7:0] IWDATA = REGI_slave.IWDATA;
   wire       IWE    = REGI_slave.IWE;

   wire [7:0] IRADDR = REGI_slave.IRADDR;
   assign     REGI_slave.ORDATA = 8'h34; // TODO:
   wire       IRE    = REGI_slave.IRE;

   reg [7:0]  regi[0:255];
   genvar  g;
   
   always @ (posedge ICLK) begin
      if (IWE) begin
         regi[IWADDR] <= IWDATA;
      end
   end
   generate for (g=0; g<256; g++) begin
   assign OREG[g] = regi[g];
   end endgenerate
endmodule // REGI_TOP
