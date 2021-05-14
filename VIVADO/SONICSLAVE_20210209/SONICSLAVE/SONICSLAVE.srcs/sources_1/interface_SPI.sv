//                              -*- Mode: Verilog -*-
// Filename        : interface_SPI.sv
// Description     : 
// Author          : 
// Created On      : Wed Feb  3 16:20:57 2021
// Last Modified By: 
// Last Modified On: 2021-02-03 16:21:19
// Update Count    : 0
// Status          : Unknown, Use with caution!
//=======================================================================
interface interface_SPI;
   logic SCLK;
   logic XCS;
   logic MOSI;
   logic MISO;

   modport master(
      output .OSCLK(SCLK), .OXCS(XCS), .OMOSI(MOSI),
      input  .IMISO(MISO)
   ); // master
   modport slave(
      input  .ISCLK(SCLK), .IXCS(XCS), .IMOSI(MOSI),
      output .OMISO(MISO)
   ); // slave
endinterface // SPI_intf
//=======================================================================
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


