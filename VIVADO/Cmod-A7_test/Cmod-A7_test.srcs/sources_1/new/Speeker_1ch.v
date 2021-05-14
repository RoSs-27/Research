`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/13 15:08:54
// Design Name: 
// Module Name: Speeker_1ch
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


module Speeker_1ch(CLK, RST, BTN, LED, GPIO);
    parameter ChatteringTime = 18'd240000;  // 20ms Chattering cut time
//    parameter ChatteringTime = 18'd10;      // For simulation
    parameter SpeekerFreq = 18'd300;        // 40[kHz]
//    parameter SpeekerFreq = 18'd2;
    
    input   CLK;
    input   RST;
    input   BTN;
    output  LED;
    output  GPIO;
    reg     [17:0]  clk_cnt1, clk_cnt2;
    reg             buf1, buf2;
    reg             btn_out;    // Button ON/OFF
    reg             led_out;    // LED ON/OFF
    reg             sp_out;     // Speeker ON/OFF
    wire            en50Hz = (clk_cnt1 == ChatteringTime);
    wire            en40kHz = (clk_cnt2 == SpeekerFreq);
    
    // Clock counter
    always @(posedge CLK or posedge RST) begin
        if(RST)
            clk_cnt1 <= 18'b0;
        else if(en50Hz)
            clk_cnt1 <= 18'b0;
        else
            clk_cnt1 <= clk_cnt1 + 1;
            
        if(RST)
            clk_cnt2 <= 18'b0;
        else if(en40kHz)
            clk_cnt2 <= 18'b0;
        else
            clk_cnt2 <= clk_cnt2 + 1;
    end
    
    // Chattering cut Buffer
    always @(posedge CLK or posedge RST) begin
        if(RST) begin
            buf1 <= 1'b0;
            buf2 <= 1'b0;
        end
        else if(en50Hz) begin
            buf2 <= buf1;
            buf1 <= BTN;
        end
    end
    
    // Save a state of button
    wire btn_buf = buf1 & ~buf2 & en50Hz;
    
    // Input button (sync clock)
    always @(posedge CLK or posedge RST) begin
        if(RST)
            btn_out <= 1'b0;
        else
            btn_out <= btn_buf;
    end

    // Switch a state of LED (speeker)
    always @(posedge btn_out or posedge RST) begin
        if(RST)
            led_out <= 1'b0;
        else
            led_out <= ~led_out;
    end
    
    // Output ultrasonic waves
    always @(posedge en40kHz or posedge RST) begin
        if(RST)
            sp_out <= 1'b0;
        else if(!led_out)
            sp_out <= 1'b0;
        else
            sp_out <= ~sp_out;
    end

    assign  LED = led_out;
    assign  GPIO = sp_out;
endmodule