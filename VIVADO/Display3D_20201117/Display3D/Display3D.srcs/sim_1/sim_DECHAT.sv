//                              -*- Mode: Verilog -*-
// Filename        : sim_DECHAT.sv
// Description     : 
// Author          : 
// Created On      : Mon Nov 16 21:10:10 2020
// Last Modified By: 
// Last Modified On: 2020-11-16 21:11:53
// Update Count    : 0
// Status          : Unknown, Use with caution!

`timescale 1ns / 1ns

module sim_DECHAT () ;

   reg I, ICLK;
   wire O;

   DECHAT dechat (.I, .O, .ICLK);

   initial begin
      fork
         forever begin
            #5 ICLK = 1'b0;
            #5 ICLK = 1'b1;
         end
         begin
            
         end
      join
   end
   
endmodule // sim_DECHAT

