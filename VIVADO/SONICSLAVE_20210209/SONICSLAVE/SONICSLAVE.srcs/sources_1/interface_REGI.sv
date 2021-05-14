//                              -*- Mode: Verilog -*-
// Filename        : interface_REGI.sv
// Description     : 
// Author          : 
// Created On      : Wed Feb  3 15:53:18 2021
// Last Modified By: 
// Last Modified On: 2021-02-03 15:53:18
// Update Count    : 0
// Status          : Unknown, Use with caution!

//interface REGI_intf(input wire ICLK, input wire IRST);
interface interface_REGI;
   logic       WE;
   logic [7:0] WADDR;
   logic [7:0] WDATA;
   logic       RE;
   logic [7:0] RADDR;
   logic [7:0] RDATA;
  
   modport master(
      output .OWE(WE), .OWADDR(WADDR), .OWDATA(WDATA),
      output .ORE(RE), .ORADDR(RADDR), 
      input  .IRDATA(RDATA)
   );
   modport slave(
      input  .IWE(WE), .IWADDR(WADDR), .IWDATA(WDATA),
      input  .IRE(RE), .IRADDR(RADDR), 
      output .ORDATA(RDATA)
   );
endinterface // interface_REGI


