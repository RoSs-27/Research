`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/13 13:00:07
// Design Name: 
// Module Name: Blinky_tb
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


module Blinky_tb;
reg     CLK;
reg     RST;
wire    LED;

parameter STEP = 10;

Blinky Blinky(
    .LED(LED),
    .RST(RST),
    .CLK(CLK)
);

always begin
    #(STEP/2)   CLK = 1'b0;
    #(STEP/2)   CLK = 1'b1;
end

initial begin
            RST = 1;
    #STEP   RST = 0;
    #STEP   RST = 1;
    #(STEP * 100000)
    #STEP   $finish;
end


endmodule
