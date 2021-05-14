//                              -*- Mode: Verilog -*-
// Filename        : DECHAT.sv
// Description     : 
// Author          : 
// Created On      : Mon Nov 16 20:59:55 2020
// Last Modified By: 
// Last Modified On: 2020-11-16 21:09:46
// Update Count    : 0
// Status          : Unknown, Use with caution!

module DECHAT (
   input wire I,
   output reg O,
   input wire ICLK  //-- 12MHz
   );
   parameter [15:0] MAX_CNT = 16'hFFFF;
   //================================================
   reg [15:0] cnt;
   always @ (posedge ICLK) begin
      if (!I) cnt <= 16'd0;
      else if (cnt < MAX_CNT) cnt <= cnt + 16'd1;
   end
   
   always @ (posedge ICLK) begin
      if (cnt < MAX_CNT) O <= 1'b0;
      else               O <= 1'b1;
   end
endmodule // DECHAT
