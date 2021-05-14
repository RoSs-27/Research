//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Tue Jan 12 19:59:26 2021
//Host        : Parasha running 64-bit major release  (build 9200)
//Command     : generate_target MCU_wrapper.bd
//Design      : MCU_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MCU_wrapper
   (ISYSCLK,
    ISYSRST,
    OCLK10,
    OCLK100,
    OLOCKED,
    ORST100);
  input ISYSCLK;
  input ISYSRST;
  output OCLK10;
  output OCLK100;
  output OLOCKED;
  output [0:0]ORST100;

  wire ISYSCLK;
  wire ISYSRST;
  wire OCLK10;
  wire OCLK100;
  wire OLOCKED;
  wire [0:0]ORST100;

  MCU MCU_i
       (.ISYSCLK(ISYSCLK),
        .ISYSRST(ISYSRST),
        .OCLK10(OCLK10),
        .OCLK100(OCLK100),
        .OLOCKED(OLOCKED),
        .ORST100(ORST100));
endmodule
