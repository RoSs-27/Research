`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/16 14:44:13
// Design Name: 
// Module Name: GEN_WAVE
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


module GEN_WAVE(
    input   ICLK,
    input   IRST,
    output  OSIG
);

parameter Cycle = 8'd150;
//parameter Cycle = 8'd8;   // For simulation.
integer clk_cnt = 0;

reg out_signal = 1'b0;
wire pulse = (clk_cnt == Cycle - 1);

always_ff @(posedge ICLK) begin
    if(IRST)
        clk_cnt <= 0;
    else if(pulse)
        clk_cnt <= 0;
    else
        clk_cnt <= clk_cnt + 1;
end

always_ff @(posedge ICLK) begin
    if(IRST)
        out_signal = 1'b0;
    else if(pulse)
        out_signal <= ~out_signal;
end

assign OSIG = out_signal;

endmodule
