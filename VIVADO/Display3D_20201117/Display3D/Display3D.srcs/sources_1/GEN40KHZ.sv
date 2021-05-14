//                              -*- Mode: Verilog -*-
// Filename        : GEN40KHZ.sv
// Description     : 
// Author          : 
// Created On      : Sat Nov 14 21:38:48 2020
// Last Modified By: 
// Last Modified On: 2020-11-14 22:03:01
// Update Count    : 0
// Status          : Unknown, Use with caution!
module GEN40KHZ (
   output reg O40KHZ,
   output reg O40KHZ_R,
   output reg O40KHZ_F,
   input wire IRST,   
   input wire ICLK   // 10MHz
   );
   //-------------------------------------------------
   localparam DIV_MAX = 8'd249;
   localparam DIV_RISE = 8'd249;
   localparam DIV_FALL = 8'd124;

   reg [7:0]  r_div;
   always @ (posedge ICLK) begin
      if (IRST)                  r_div <= 8'd0;
      else if (r_div >= DIV_MAX) r_div <= 8'd0;
      else                       r_div <= r_div + 8'd1;
   end

   wire s_fall = (r_div==DIV_FALL);
   always @ (posedge ICLK) begin
      if (IRST) O40KHZ_F <= 1'b0;
      else      O40KHZ_F <= s_fall;
   end
   
   wire s_rise = (r_div==DIV_RISE);
   always @ (posedge ICLK) begin
      if (IRST) O40KHZ_R <= 1'b0;
      else      O40KHZ_R <= s_rise;
   end

   always @ (posedge ICLK) begin
      if (IRST) O40KHZ <= 1'b1;
      else if (O40KHZ_F) O40KHZ <= 1'b0;
      else if (O40KHZ_R) O40KHZ <= 1'b1;
   end

endmodule // GEN40KHZ
