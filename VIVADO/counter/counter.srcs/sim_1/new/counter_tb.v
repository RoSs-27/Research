`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 16:01:48
// Design Name: 
// Module Name: counter_tb
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


module counter_tb;
reg clk;
reg rst;
reg btnu;
reg [9:0] i;
wire [7:0] led;

parameter STEP = 10;
parameter LOOP = 1000;

counter counter(clk, rst, btnu, led);

always begin
    clk = 0;    #(STEP/2);
    clk = 1;    #(STEP/2);
end

initial begin
            rst = 1;    btnu = 0;
    #STEP   rst = 0;
    #STEP   rst = 1;
    for(i = 0; i < LOOP; i=i+1) begin
        #(STEP*5)  btnu = 1;
        #(STEP*5)  btnu = 0;
    end
    #STEP   $finish;
end
endmodule
