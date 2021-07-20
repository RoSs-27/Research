`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kochi University
// Engineer: H.Iwaasa
// 
// Create Date: 2021/07/02 14:52:11
// Design Name: 
// Module Name: FPGA_TOP
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


module FPGA_TOP (
    input   CLK,
    input   [1:0]   BTN,
    input   XA_N, XA_P,
    input   VN_IN, VP_IN,
    output  [1:0]   LED,
    output  [35:0]  SP,
    inout   IO_SP_WAVE,
    inout   IO_STATE
);

parameter   PinNumber = 36;
parameter   WaveCycle = 8'd150;
//parameter   WaveCycle = 8'd8;   // For simulation

reg     rst, alloc;     // Button state
reg     [1:0]   alloc_shift;
reg     sp_wave;        // Ultrasonic wave
reg     delay_sp_wave;
reg     master_mode = 0;    // 0:slave  1:master

// ### XADC variable ###
reg      [6:0]  address_in = 7'h14;
wire    [15:0]  data;
wire    [11:0]  shifted_data = (data >> 4) & 12'hff0;
wire    enable;
wire    ready;

// ### XADC instantiation. ###
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
//    .reset_in(~rst)
);

// ### Check if button is pressed. ###
BTN_CHECK rst_btn (
    .ICLK(CLK),
    .IBTN(BTN[0]),
    .OBTN(rst)
);
BTN_CHECK alloc_btn (
    .ICLK(CLK),
    .IBTN(BTN[1]),
    .OBTN(alloc)
);

// ### Generate 40[kHz] signal. ###
GEN_WAVE #(.Cycle(WaveCycle)) sp_signal (
    .ICLK(CLK),
    .IRST(rst),
    .OSIG(sp_wave)
);
GEN_DLY_WAVE #(.Cycle(WaveCycle)) delay_sp_signal (
    .ICLK(CLK),
    .IRST(rst),
    .IDLY(shifted_data),
    .ISIG(sp_wave),
    .OSIG(delay_sp_wave)
);

// ### Mode switching ###
always_ff @(posedge CLK) begin
    if(rst)
        alloc_shift <= 2'b00;
    else
        alloc_shift <= { alloc_shift[0], alloc };
end

always_ff @(posedge CLK) begin
    if(rst)
        master_mode <= 1'b0;
    else if(alloc_shift == 2'b01)
        master_mode <= ~master_mode;
//    else
//        master_mode <= master_mode & ~IO_STATE;
end

// ### Address Handling Controlled by button. ###
//always @(negedge(ready)) begin
//    if(alloc)
//        address_in <= 8'h1c;
//    else
//        address_in <= 8'h14;
//end 



// ### Pin assign. ###
//assign LED = { alloc, rst };
assign LED = { master_mode, IO_STATE };
assign IO_STATE = (master_mode ? 1'b1 : 1'bz);
assign IO_SP_WAVE = (master_mode ? delay_sp_wave : 1'bz);

generate
    for(genvar i = 0; i < PinNumber; i = i + 1)
        assign SP[i] = (master_mode ? sp_wave : IO_SP_WAVE);
endgenerate

endmodule



// ### 設計仕様 ###
// 一つのプロジェクトでmaster，slaveに対応
// ボタンでmaster設定(allocで切り換え)
//

// ### Pin number ###
// Digital: 1~14, 17~23, 26~48
// Analog: 15, 16
// VU: 24
// GND: 25