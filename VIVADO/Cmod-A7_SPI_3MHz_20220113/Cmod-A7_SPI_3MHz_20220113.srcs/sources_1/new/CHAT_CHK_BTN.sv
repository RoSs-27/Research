`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 16:23:58
// Design Name: 
// Module Name: CHAT_CHK_BTN
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


module CHAT_CHK_BTN(
   input   ICLK,
   input   IBTN,
   output  OBTN
   );
   
//   localparam ChatCheckTime = 18'd240000;  // Chattering check time (20[ms])
   localparam ChatCheckTime = 18'd10;      // For simulation.
   integer clk_cnt = 0;
   
   reg btn_out = 1'b0;
   reg [1:0] buffer = 2'b00;
   wire pulse50Hz = (clk_cnt == ChatCheckTime);
   
   always_ff @(posedge ICLK) begin
       if(pulse50Hz) begin
           clk_cnt <= 0;
           buffer <= { buffer[0], IBTN };
       end
       else begin
           clk_cnt <= clk_cnt + 1;
       end
   end
   
   always_comb begin
       if(buffer == 2'b11)
           btn_out <= 1'b1;
       else
           btn_out <= 1'b0;
   end
   
   assign OBTN = btn_out;
   
endmodule
