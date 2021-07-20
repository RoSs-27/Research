`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 18:36:25
// Design Name: 
// Module Name: GEN_WAVE_40kHz
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


module GEN_WAVE_40kHz(
    input   ICLK,
    input   IRST,
    output  OSIG
);

//localparam Freq80kHzTime = 8'd150;
localparam Freq80kHzTime = 8'd8;   // For simulation.
integer clk_cnt = 0;

reg out_signal = 1'b0;
wire pulse80kHz = (clk_cnt == Freq80kHzTime);

always_ff @(posedge ICLK) begin
    if(IRST)
        clk_cnt <= 0;
    else if(pulse80kHz)
        clk_cnt <= 0;
    else
        clk_cnt <= clk_cnt + 1;
end

always_ff @(posedge ICLK) begin
    if(IRST)
        out_signal = 1'b0;
    else if(pulse80kHz)
        out_signal <= ~out_signal;
end

assign OSIG = out_signal;

endmodule

