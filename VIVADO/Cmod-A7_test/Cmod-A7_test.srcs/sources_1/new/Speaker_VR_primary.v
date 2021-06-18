`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Kochi University
// Engineer: H.Iwaasa
// 
// Create Date: 2021/06/18 10:27:09
// Design Name: 
// Module Name: Speaker_VR_primary
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This program operates all speaker by variable resistor.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Speaker_VR_primary(
    input   CLK,
    input   RST,
    input   BTN,
    input   XA_N,
    input   XA_P,
    input   VN_IN,
    input   VP_IN,
    output  LED,
    output  LED_VR,
    output  [35:0]  GPIO,
    output  FREQ40kHz
);

parameter ChatteringTime = 18'd240000;    // 20ms Chattering cut time
//parameter ChatteringTime = 18'd10;      // For simulation
parameter SpeakerFreq = 18'd150;        // 40[kHz] frequency
//parameter SpeakerFreq = 18'd2;          // For simulation
parameter PwmEnd = 1000;
//parameter PwmEnd = 1;

integer clk_cnt1 = 0;
integer clk_cnt2 = 0;
integer pwm_cnt = 0;

//reg     [17:0]  clk_cnt1, clk_cnt2;
reg     [6:0]   address_in = 7'h14;
reg             buf1, buf2;
reg             btn_out;    // Button ON/OFF
reg             led_out;    // LED ON/OFF
reg             sp_out;     // Speeker ON/OFF
wire    [15:0]  data;       // Analog input value
wire            enable;
wire            ready;
wire            en50Hz = (clk_cnt1 == ChatteringTime);  // Encode to 50[Hz]
wire            en40kHz = (clk_cnt2 == SpeakerFreq);    // Encode to 40[kHz]
wire    [11:0]  shifted_data = (data >> 4) & 12'hff0;

//XADC instantiation
xadc_wiz_0 XLXI_7(
    .daddr_in(address_in), 
    .dclk_in(CLK), 
    .den_in(enable), 
    .di_in(0), 
    .dwe_in(0), 
    .busy_out(),
    .vauxp4(XA_P),
    .vauxn4(XA_N),               
    .do_out(data), 
    .vp_in(VP_IN),
    .vn_in(VN_IN),
    .eoc_out(enable),
    .channel_out(),
    .drdy_out(ready)
);
wire    clk;

// Clock counter
always @(posedge CLK or posedge RST) begin
    if(RST)
        clk_cnt1 <= 0;
    else if(en50Hz)
        clk_cnt1 <= 0;
    else
        clk_cnt1 <= clk_cnt1 + 1;
        
    if(RST)
        clk_cnt2 <= 0;
    else if(en40kHz)
        clk_cnt2 <= 0;
    else
        clk_cnt2 <= clk_cnt2 + 1;
        
    if(RST)
        pwm_cnt <= 0;
    else if(shifted_data)
        pwm_cnt <= 0;
    else
        pwm_cnt <= pwm_cnt + 1;
end

// Chattering cut buffer
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

// Address Handling Controlled by button
always @(negedge(ready)) begin
    if(btn_out)
        address_in <= 8'h1c;
    else
        address_in <= 8'h14;
end 

// Pin assign
assign FREQ40kHz = en40kHz;
assign LED = led_out;
for(genvar i = 0; i < 36; i = i + 1) begin
    assign GPIO[i] = sp_out;
end

assign LED_VR = (pwm_cnt < shifted_data ? 1'b0 : 1'b1);

endmodule