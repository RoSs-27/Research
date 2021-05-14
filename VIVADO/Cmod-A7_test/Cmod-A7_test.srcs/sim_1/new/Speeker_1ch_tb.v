`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/13 15:20:06
// Design Name: 
// Module Name: Speeker_1ch_tb
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


module Speeker_1ch_tb;
reg     CLK;
reg     RST;
reg     BTN;
wire    LED;
wire    GPIO;

parameter   STEP = 10;

Speeker_1ch SP1(CLK, RST, BTN, LED, GPIO);

always begin
    CLK = 0;    #(STEP/2);
    CLK = 1;    #(STEP/2);
end

initial begin
                RST = 0;    BTN = 0;
    #STEP       RST = 1;
    #STEP       RST = 0;
    #(STEP*10)              BTN = 1;
    #(STEP*10)              BTN = 0;
    #(STEP*20)              BTN = 1;
    #(STEP*10)              BTN = 0;
end

endmodule
