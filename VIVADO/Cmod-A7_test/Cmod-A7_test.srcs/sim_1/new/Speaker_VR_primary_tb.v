`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/18 16:00:05
// Design Name: 
// Module Name: Speaker_VR_primary_tb
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


module Speaker_VR_primary_tb;
reg   CLK;
reg   RST;
reg   BTN;
reg   XA_N;
reg   XA_P;
reg   VN_IN;
reg   VP_IN;
wire  LED;
wire  LED_VR;
wire  [35:0]  GPIO;
wire  FREQ40kHz;

parameter   STEP = 10;

Speaker_VR_primary SPVRp(CLK, RST, BTN, XA_N, XA_P, VN_IN, VP_IN, LED, LED_VR, GPIO, FREQ40kHz);

always begin
    CLK = 0;    #(STEP/2);
    CLK = 1;    #(STEP/2);
end

initial begin
                RST = 0;    BTN = 0;    XA_N = 0;   XA_P = 0;   VN_IN = 0;  VP_IN = 0;
    #STEP       RST = 1;
    #STEP       RST = 0;
    #(STEP*20)              BTN = 1;
    #(STEP*20)              BTN = 0;    XA_N = 0;   XA_P = 1;   VN_IN = 0;  VP_IN = 1;
    #(STEP*40)              BTN = 1;
    #(STEP*20)              BTN = 0;
    #(STEP*200)             BTN = 0;
end

endmodule
