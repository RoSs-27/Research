`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/19 15:59:40
// Design Name: 
// Module Name: blinky_tb
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


module blinky_tb;
reg     CLK;
reg     RST;
wire    LED;

parameter STEP = 10;

blinky blinky(
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
    #(STEP * 1000000)
    #STEP   $finish;
end

endmodule
