`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 15:44:27
// Design Name: 
// Module Name: counter
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


module counter(clk, rst, btnu, led);
    parameter ChatteringTime = 21'd2000000-1;   //20ms チャタリング防止用定数
    //parameter ChatteringTime = 22'd10;          //10ns チャタリング防止用定数（シミュレーション用）
    
    input           clk;
    input           rst;
    input           btnu;
    output  [7:0]   led;
    reg     [20:0]  clk_cnt;
    reg             buf1, buf2;
    reg     [7:0]   btn_cnt;
    reg             btn_out;
    wire            en50hz = (clk_cnt == ChatteringTime);   //ChatteringTimeで分周して50Hzを生成
    
    //クロックカウンタ
    always @(posedge clk or negedge rst) begin
        if(!rst)
            clk_cnt <= 21'b0;
        else if(en50hz)
            clk_cnt <= 21'b0;
        else
            clk_cnt <= clk_cnt + 1;
    end
    
    //チャタリング防止用バッファ
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            buf1 <= 1'b0;
            buf2 <= 1'b0;
        end
        else if(en50hz) begin
            buf2 <= buf1;
            buf1 <= btnu;
        end
    end
    
    //ボタン入力判定を一時保存
    wire btn_buf = buf1 & ~buf2 & en50hz;
    
    //クロック同期でボタン入力
    always @(posedge clk or negedge rst) begin
        if(!rst)
            btn_out <= 1'b0;
        else
            btn_out = btn_buf;
    end
    
    //ボタン入力カウンタ
    always @(posedge btn_out or negedge rst) begin
        if(!rst)
            btn_cnt <= 8'b0;
        else if(btn_cnt == 8'hFF)
            btn_cnt <= 8'b0;
        else
            btn_cnt <= btn_cnt + 1;
    end
    
    //LEDピンに出力
    assign led[0] = btn_cnt[0];
    assign led[1] = btn_cnt[1];
    assign led[2] = btn_cnt[2];
    assign led[3] = btn_cnt[3];
    assign led[4] = btn_cnt[4];
    assign led[5] = btn_cnt[5];
    assign led[6] = btn_cnt[6];
    assign led[7] = btn_cnt[7];
endmodule
