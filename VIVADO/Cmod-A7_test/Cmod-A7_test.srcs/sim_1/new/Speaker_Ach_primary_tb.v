`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 16:44:43
// Design Name: 
// Module Name: Speaker_Ach_primary_tb
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


module Speaker_Ach_primary_tb;
reg     CLK;
reg     RST;
reg     BTN;
wire    LED;
wire    GPIO;
wire    FREQ40kHz;

parameter   STEP = 10;

Speaker_Ach_primary SPAp(CLK, RST, BTN, LED, GPIO, FREQ40kHz);

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
