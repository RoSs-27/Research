//                              -*- Mode: Verilog -*-
// Filename        : tb_TOP.sv
// Description     : 
// Author          : 
// Created On      : Tue Jan 12 19:55:04 2021
// Last Modified By: 
// Last Modified On: 2021-01-22 13:57:37
// Update Count    : 0
// Status          : Unknown, Use with caution!
`timescale 1ns / 10ps

`include "USER_DEFINES.vh"

module tb_TOP (/*void*/);
   logic SYSCLK;  //-- 12 MHz Xtal clock.
   logic ISPI_SCLK, ISPI_XCS, SPI_MOSI, SPI_MISO;

   initial begin
      SPI_Idle();
      fork
         begin
            @(posedge fpga_top.locked);
            #1000;
            
            SPI_RegWR(8'h00, 8'h12);
            SPI_RegWR(8'h01, 8'h34);
            SPI_RegWR(8'h02, 8'h56);
            
         end
         forever begin
            #41.666 SYSCLK <= 1'b1; //-- Always running.
            #41.666 SYSCLK <= 1'b0;
         end
         forever begin
            #50 ISPI_SCLK <= 1'b1; //-- Always running.
            #50 ISPI_SCLK <= 1'b0;
         end
      join
   end

   FPGA_TOP fpga_top (
      .ISPI_SCLK, 
      .ISPI_XCS,
      .ISPI_MOSI(SPI_MOSI),
      .OSPI_MISO(SPI_MISO),
      .ISYSCLK(SYSCLK)
   );

   task SPI_RegWR(byte addr, byte data);
      begin
         //SPI_AssertXCS();
         SPI_Send(`CMD_REGWR);
         SPI_Send(addr);
         SPI_Send(data);
         SPI_NegateXCS();
      end
   endtask // SPI_RegWr

   task SPI_RegRD(byte addr, byte data);
      begin
         //SPI_AssertXCS();
         SPI_Send(`CMD_REGRD);
         SPI_Send(addr);
         SPI_Send(data);
         SPI_NegateXCS();
      end
   endtask // SPI_RegWr

   task SPI_Send(reg [7:0] data);
      begin
         integer i;
         
         //SPI_AssertXCS();
         for (i=7; i>=0; i=i-1) begin
            @(posedge ISPI_SCLK) #7;
            ISPI_XCS = 1'b0;
            SPI_MOSI = data[i];
         end
         //SPI_NegateXCS();
      end
   endtask // SPI_Send

   task SPI_AssertXCS;
      begin
         @(posedge ISPI_SCLK) #7;
         ISPI_XCS = 1'b0;
      end
   endtask //
   
   task SPI_NegateXCS;
      begin
         @(posedge ISPI_SCLK) #7;
         ISPI_XCS = 1'b1;
      end
   endtask //
   task SPI_Idle;
      begin
         ISPI_XCS = 1'b1;
      end
   endtask
endmodule // tb_TOP

