`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 16:45:30
// Design Name: 
// Module Name: Speaker_Ach_replica_tb
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


module Speaker_Ach_replica_tb;
reg     CLK;
reg     RST;
reg     BTN;
reg     FREQ40kHz;
wire    LED;
wire    GPIO;

parameter   STEP = 10;

Speaker_Ach_replica SPAr(CLK, RST, BTN, FREQ40kHz, LED, GPIO);

always begin
    CLK = 0;    #(STEP/2);
    CLK = 1;    #(STEP/2);
end

always begin
    FREQ40kHz = 0;  #STEP;
    FREQ40kHz = 1;  #STEP;
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
