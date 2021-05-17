`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/13 12:56:09
// Design Name: 
// Module Name: Blinky
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


module Blinky(
    input CLK,
    input RST,
    output LED
    );
    
    reg led_out;
    reg [23:0] led_cnt;
    parameter led_cnt_1s = 24'd12000000-1;
    //parameter led_cnt_1s = 24'd9;
    
    always @(posedge CLK or negedge RST) begin
        if(RST)
            led_cnt <= 0;
        else if(led_cnt == led_cnt_1s)
            led_cnt <= 24'b0;
        else
            led_cnt <= led_cnt + 24'b1;
    end
    
    always @(posedge CLK or negedge RST) begin
        if(RST)
            led_out <= 1'b0;
        else if(led_cnt == led_cnt_1s)
            led_out <= ~led_out;
        else
            led_out <= led_out;
    end
    
    assign LED = led_out;
endmodule

