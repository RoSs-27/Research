-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Wed Nov 17 18:14:22 2021
-- Host        : DESKTOP-026M7H9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/b183r035m/Documents/workspace/Research/VIVADO/Cmod-A7_QSPI_20211109/Cmod-A7_QSPI_20211109.srcs/sources_1/ip/CLKGEN/CLKGEN_stub.vhdl
-- Design      : CLKGEN
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLKGEN is
  Port ( 
    OCLK100MHZ : out STD_LOGIC;
    OLOCKED : out STD_LOGIC;
    ICLK12MHZ : in STD_LOGIC
  );

end CLKGEN;

architecture stub of CLKGEN is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "OCLK100MHZ,OLOCKED,ICLK12MHZ";
begin
end;
