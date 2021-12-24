`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/16 15:28:12
// Design Name: 
// Module Name: FPGA
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


module FPGA(
    //-- SPI slave
    input wire ISPI_CLK, //-- 10MHz
    input wire ISPI_MOSI,
    input wire ISPI_XCS,
    output reg OSPI_MISO,
    input ICLK,   //-- 12 MHz
    input [7:0] IADDR,
    input [7:0] IDATA,
    output [7:0] ODATA
);
    
    reg [7:0]   mem [0:255];
    reg [7:0]   sp_data;
   wire clk100;
   wire s_locked;

    CLKGEN clkgen ( 
       .ICLK12MHZ (ICLK), 
       .OCLK100MHZ (clk100), 
       //.resetn(1'b1),
       .OLOCKED(s_locked)
    );

    reg [2:0] r_spi_clk;
    always @(posedge clk100) begin
        r_spi_clk <= {r_spi_clk[1:0], ISPI_CLK};
    end
    wire s_spi_clk_rise = (r_spi_clk[2:1]==2'b01);
    wire s_spi_clk_fall = (r_spi_clk[2:1]==2'b10);
    
    reg [2:0] r_spi_xcs;
    always @(posedge clk100) begin
        r_spi_xcs <= {r_spi_xcs[1:0], ISPI_XCS};
    end
    wire s_spi_xcs_rise = (r_spi_xcs[2:1]==2'b01);
    wire s_spi_xcs_fall = (r_spi_xcs[2:1]==2'b10);
    
    reg [2:0] r_spi_mosi;
    always @(posedge clk100) begin
        r_spi_mosi <= {r_spi_mosi[1:0], ISPI_MOSI};
    end
    
    reg [7:0] mosi_shift;
    always @(posedge clk100) begin
       if (s_spi_xcs_fall) begin
           mosi_shift <= {mosi_shift[6:0], r_spi_mosi[1]};
       end
    end
    
    assign ODATA = sp_data;
endmodule
