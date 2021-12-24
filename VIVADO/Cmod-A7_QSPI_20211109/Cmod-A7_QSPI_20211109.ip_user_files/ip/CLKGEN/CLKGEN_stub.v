// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Nov 17 18:14:22 2021
// Host        : DESKTOP-026M7H9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/b183r035m/Documents/workspace/Research/VIVADO/Cmod-A7_QSPI_20211109/Cmod-A7_QSPI_20211109.srcs/sources_1/ip/CLKGEN/CLKGEN_stub.v
// Design      : CLKGEN
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module CLKGEN(OCLK100MHZ, OLOCKED, ICLK12MHZ)
/* synthesis syn_black_box black_box_pad_pin="OCLK100MHZ,OLOCKED,ICLK12MHZ" */;
  output OCLK100MHZ;
  output OLOCKED;
  input ICLK12MHZ;
endmodule
