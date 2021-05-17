`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 17:53:27
// Design Name: 
// Module Name: OLED
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


module OLED(
    input   clk,
    input   rst,
    output  oled_sdin,
    output  oled_sclk,
    output  oled_dc,
    output  oled_res,
    output  oled_vbat,
    output  oled_vdd
);

    parameter   splash_str="Hiroki Iwaasa   ", splash_str_len=16;

endmodule
