//                              -*- Mode: Verilog -*-
// Filename        : USER_DEFINES.vh
// Description     : 
// Author          : 
// Created On      : Fri Jan 22 12:58:18 2021
// Last Modified By: 
// Last Modified On: 2021-02-03 18:16:27
// Update Count    : 0
// Status          : Unknown, Use with caution!

//=======================================================================
interface intf_SPI();
   logic SCLK;
   logic XCS;
   logic MOSI;
   logic MISO;

   modport mst(
      output .OSCLK(SCLK), .OXCS(XCS), .OMOSI(MOSI),
      input  .IMISO(MISO)
   ); // master
   modport slv(
      input  .ISCLK(SCLK), .IXCS(XCS), .IMOSI(MOSI),
      output .OMISO(MISO)
   ); // slave
endinterface // SPI_intf
//=======================================================================
interface intf_REGI();
   logic       WE;
   logic [7:0] WADDR;
   logic [7:0] WDATA;
   logic       RE;
   logic [7:0] RADDR;
   logic [7:0] RDATA;
  
   modport mst(
      output .OWE(WE), .OWADDR(WADDR), .OWDATA(WDATA), .ORE(RE), .ORADDR(RADDR), 
      input  .IRDATA(RDATA)
   );
   modport slv(
      input  .IWE(WE), .IWADDR(WADDR), .IWDATA(WDATA), .IRE(RE), .IRADDR(RADDR), 
      output .ORDATA(RDATA)
   );
endinterface // interface_REGI

module INTERFACE_DUMMY (/*AUTOARG*/ ) ;
   
endmodule // DUMMY_0



