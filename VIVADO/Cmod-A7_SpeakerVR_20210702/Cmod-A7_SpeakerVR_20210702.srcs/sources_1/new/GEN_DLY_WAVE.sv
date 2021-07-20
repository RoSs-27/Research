`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/16 14:44:33
// Design Name: 
// Module Name: GEN_DLY_WAVE
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


module GEN_DLY_WAVE(
    input   ICLK,
    input   IRST,
    input   [11:0] IDLY,
    input   ISIG,
    output  OSIG
);

//localparam IDLY = 12'h800;  // For simulation.

parameter Cycle = 8'd150;
//parameter Cycle = 8'd8;    // For simulation.
integer clk_cnt = 0;

reg out_delay_signal = 1'b0;
reg  [1:0] wave_shift;
reg [31:0] conv_data;
wire delay_flag = (clk_cnt == conv_data) & ~IRST;

always_ff @(posedge ICLK) begin 
    if(IRST)
        wave_shift <= 2'b00;
    else
        wave_shift <= { wave_shift[0], ISIG };
end

always_ff @(posedge ICLK) begin
    if(IRST)
        clk_cnt <= 0;
    else if(wave_shift == 2'b01 || wave_shift == 2'b10)
        clk_cnt <= 0;
    else
        clk_cnt <= clk_cnt + 1;
end

always_ff @(posedge ICLK) begin
    if(IRST)
        conv_data <= 32'd0;
    else if(wave_shift == 2'b01)
        conv_data <= (IDLY * Cycle*5) / 12'hfff;
end

always_ff @(posedge ICLK) begin
    if(IRST)
        out_delay_signal <= 1'b0;
    else if(delay_flag)
        out_delay_signal <= (ISIG ? 1'b1 : 1'b0);   // 微妙，「out_delay_signal <= ~out_delay_signal」にしたい．
end

assign OSIG = out_delay_signal;

endmodule
