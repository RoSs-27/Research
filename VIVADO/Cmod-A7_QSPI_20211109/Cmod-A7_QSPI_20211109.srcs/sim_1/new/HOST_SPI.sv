`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/12 17:35:15
// Design Name: 
// Module Name: HOST_SPI
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


module HOST_SPI(
   output OSPI_CLK,
   output OSPI_MOSI,
   output OSPI_XCS,
   input  ISPI_MISO
   );

   localparam MODE_LEN = 4;
   localparam ID_LEN = 4;
   localparam ADDR_LEN = 8;
   localparam DATA_LEN = 8;
   
   localparam TX_LEN = MODE_LEN + ID_LEN + ADDR_LEN + DATA_LEN;    //-- Transaction length

   reg spi_clk;
   reg spi_mosi;
   reg spi_xcs;
   
   initial begin
      init();
      #60050;
      #1000   send_data(4'h0, 4'h0, 8'h00, 8'hA7);    //-- to CmodA7_t0
      #1000   send_data(4'h0, 4'h0, 8'h01, 8'hC7);    //-- to CmodA7_t0
      #1000   send_data(4'h0, 4'h0, 8'h02, 8'hD2);    //-- to CmodA7_t0
      #1000   send_data(4'h0, 4'h0, 8'h05, 8'h55);    //-- to CmodA7_t0
      
      #1000   send_data(4'h0, 4'h1, 8'h01, 8'hAB);    //-- to CmodA7_t1
      #1000   send_data(4'h0, 4'h2, 8'h02, 8'hCD);    //-- to CmodA7_t2
      #1000   send_data(4'h0, 4'h1, 8'h00, 8'hEF);    //-- to CmodA7_t1
      #1000   send_data(4'h0, 4'h3, 8'h03, 8'h33);    //-- to CmodA7_t3
           
      #1000   send_data(4'h8, 4'h0, 8'h00, 8'h00);    //-- to CmodA7_t0
      #1000   send_data(4'h8, 4'h1, 8'h01, 8'h00);    //-- to CmodA7_t1
      #1000   send_data(4'h8, 4'h2, 8'h02, 8'h00);    //-- to CmodA7_t2
      #1000   send_data(4'h8, 4'h3, 8'h03, 8'h00);    //-- to CmodA7_t3
   end
    
   initial begin
      forever begin
         spi_clk = 1'b0;     #50;
         spi_clk = 1'b1;     #50;
      end
   end
    
   assign OSPI_CLK = spi_clk;
   assign OSPI_XCS = spi_xcs;
   assign OSPI_MOSI = spi_mosi;
   
   task init();
      begin
         spi_xcs = 1'b1;
         spi_mosi = 1'b1;
      end
   endtask;
        

   task send_data(
      input  [MODE_LEN-1:0] act_mode,  //-- 4'h8:Read, 4'h0:Write
      input    [ID_LEN-1:0] tgt_id,
      input  [ADDR_LEN-1:0] tgt_addr,
      input  [DATA_LEN-1:0] ord_data
      );
      
      begin
         spi_xcs = 1'b1;    // 通信開始
         //spi_mosi = 1'b0;
                  
         repeat(MODE_LEN) @(negedge spi_clk) begin    // 命令内容を送信
            spi_xcs = 1'b0;
            spi_mosi = act_mode[MODE_LEN-1];
            act_mode = {act_mode[MODE_LEN-2:0], 1'b0};
         end
            
         repeat(ID_LEN) @(negedge spi_clk) begin    // 命令先ボード番号を送信
            spi_mosi = tgt_id[ID_LEN-1];
            tgt_id = {tgt_id[ID_LEN-2:0], 1'b0};
         end
            
         repeat(ADDR_LEN) @(negedge spi_clk) begin    // データ格納先アドレスを送信
            spi_mosi = tgt_addr[ADDR_LEN-1];
            tgt_addr = {tgt_addr[ADDR_LEN-2:0], 1'b0};
         end
            
         repeat(DATA_LEN+1) @(negedge spi_clk) begin    // データ本体を送信
            spi_mosi = ord_data[DATA_LEN-1];
            ord_data = {ord_data[DATA_LEN-2:0], 1'b0};
         end
         
         repeat(100) @(posedge spi_clk);                     
         spi_xcs = 1'b1;    // 通信終了
      end
   endtask
   
//   task request_data();
  
endmodule