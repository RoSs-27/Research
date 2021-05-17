`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/19 15:54:39
// Design Name: 
// Module Name: blinky
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


module blinky(
    input CLK,
    input RST,
    output LED
);

    reg led_out;
    reg [26:0] led_cnt;
    parameter led_cnt_1s = 27'd99999999;
    //parameter led_cnt_1s = 27'd9;
    
    always @(posedge CLK or negedge RST) begin
        if(RST == 1'b0)
            led_cnt <= 0;
        else if(led_cnt == led_cnt_1s)
            led_cnt <= 27'b0;
        else
            led_cnt <= led_cnt + 27'b1;
    end
    
    always @(posedge CLK or negedge RST) begin
        if(RST == 1'b0)
            led_out <= 1'b0;
        else if(led_cnt == led_cnt_1s)
            led_out <= ~led_out;
        else
            led_out <= led_out;
    end
    
    assign LED = led_out;
endmodule
