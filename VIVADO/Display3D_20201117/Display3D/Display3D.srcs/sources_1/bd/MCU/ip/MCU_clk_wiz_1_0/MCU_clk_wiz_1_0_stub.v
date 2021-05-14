// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Mon Nov 16 23:00:05 2020
// Host        : Parasha running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/proj_sasaoka/Display3D/Display3D.srcs/sources_1/bd/MCU/ip/MCU_clk_wiz_1_0/MCU_clk_wiz_1_0_stub.v
// Design      : MCU_clk_wiz_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module MCU_clk_wiz_1_0(OCLK100, OCLK10, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="OCLK100,OCLK10,locked,clk_in1" */;
  output OCLK100;
  output OCLK10;
  output locked;
  input clk_in1;
endmodule
