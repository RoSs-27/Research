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

//localparam IDLY = 12'hfff;  // For simulation.
//localparam IDLY = 12'h800;
//localparam IDLY = 12'h400;
//localparam IDLY = 12'h200;
//localparam IDLY = 12'h555;

parameter Cycle = 8'd150;
//parameter Cycle = 8'd8;    // For simulation.

//integer clk_cnt = 0;

//reg out_delay_signal = 1'b0;
//reg  [1:0] wave_shift;
//reg [31:0] conv_data;
//reg [31:0] data_buffer = 32'd0;
//wire pulse = (clk_cnt == Cycle);
//wire delay_flag = (clk_cnt == conv_data) & ~IRST;

//always_ff @(posedge ICLK) begin 
//    if(IRST)
//        wave_shift <= 2'b00;
//    else
//        wave_shift <= { wave_shift[0], ISIG };
//end

//always_ff @(posedge ICLK) begin
//    if(IRST)
//        clk_cnt <= 0;
//    else if(wave_shift == 2'b01 || wave_shift == 2'b10)
//        clk_cnt <= 0;
//    else
//        clk_cnt <= clk_cnt + 1;
//end

//always_ff @(posedge ICLK) begin
//    if(IRST)
//        conv_data <= 32'd0;
//    else if(wave_shift == 2'b01)
//        conv_data <= (IDLY * (Cycle+50)) / 12'hfff;
//end

//always_ff @(posedge ICLK) begin
//    if(IRST)
//        out_delay_signal <= 1'b0;
//    else if(delay_flag)
////        out_delay_signal <= ~out_delay_signal;
//        out_delay_signal <= (ISIG ? 1'b1 : 1'b0);   // 微妙，「out_delay_signal <= ~out_delay_signal」にしたい．
//end

// ### Test #############################################################

localparam DelayWidth = 8;
localparam CountLimit = Cycle * DelayWidth;
integer clk_cnt1 = 0;
integer clk_cnt2 = 0;

reg out_delay_signal = 1'b0;
reg [31:0] conv_data = 32'b0;

wire cnt_limit_flag1 = (clk_cnt1 == CountLimit);
wire cnt_limit_flag2 = (clk_cnt2 == CountLimit);
wire switch_flag = ((clk_cnt2 % Cycle) ? 0 : 1);

always_ff @(posedge ICLK) begin
    if(IRST)
        conv_data<= 32'b0;
    else
        conv_data <= (IDLY * CountLimit) / 12'hff0;
end

always_ff @(posedge ICLK) begin
    if(IRST)
        clk_cnt1 <= 0;
    else if(cnt_limit_flag1)
        clk_cnt1 <= 1;
    else
        clk_cnt1 <= clk_cnt1 + 1;
end

always_comb begin
        clk_cnt2 <= (clk_cnt1 + conv_data) % CountLimit;
end

//always_ff @(posedge ICLK) begin
//    if(IRST)
//        out_delay_signal <= 1'b0;
//    else if(switch_flag)
//        out_delay_signal <= ~out_delay_signal;
//end

always_ff @(posedge ICLK) begin
    if(IRST)
        out_delay_signal <= 1'b0;
    else
        out_delay_signal <= (((clk_cnt2 / Cycle) % 2 == 0) ? 0 : 1);
end

// ### Test #############################################################

assign OSIG = out_delay_signal;

endmodule


// ISIGは必要ないのでは？