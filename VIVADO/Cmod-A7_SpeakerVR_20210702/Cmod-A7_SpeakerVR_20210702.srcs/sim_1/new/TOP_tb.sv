`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 16:35:15
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb;
// ### input signal ###
reg CLK;
reg [1:0] BTN;
reg XA_N, XA_P;
reg I_SP_WAVE;
reg I_STATE;
// ### output signal ###
wire [1:0]  LED;
wire [35:0] SP;
wire IO_SP_WAVE;
wire IO_STATE;
// ### parameter ###
parameter STEP = 10;
// ### bidirection config ###
assign IO_SP_WAVE = I_SP_WAVE;
assign IO_STATE = I_STATE;

// ### module ###
FPGA_TOP TOP(CLK, BTN, XA_N, XA_P, LED, SP, IO_SP_WAVE, IO_STATE);

// ### clock ###
always begin
    #(STEP/2);  CLK = ~CLK;
end

// ### simulation sequence ###
initial begin
    CLK = 0;    BTN = 2'b00;    XA_N = 0;    XA_P = 0;
    I_SP_WAVE = 1'bz;  I_STATE = 1'bz;
    
    #(STEP*20)  BTN = 2'b01;
    #(STEP*1)   BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b01;
    #(STEP*5)   BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b01;
    #(STEP*10)  BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b11;
    #(STEP*15)  BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b10;
    #(STEP*40)  BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b11;
    #(STEP*40)  BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b10;
    #(STEP*40)  BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b10;
    #(STEP*40)  BTN = 2'b00;
    
    #(STEP*20)  BTN = 2'b10;
    #(STEP*40)  BTN = 2'b00;
    
    #(STEP*20) I_STATE = 1'b1;
    #(STEP*100);
end

endmodule
