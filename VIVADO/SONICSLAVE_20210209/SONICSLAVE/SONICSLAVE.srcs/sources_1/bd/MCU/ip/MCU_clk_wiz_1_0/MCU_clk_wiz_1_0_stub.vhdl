-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Fri Jan 22 16:11:31 2021
-- Host        : Parasha running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/proj_VolumeDisplay/fpga/SONICSLAVE/SONICSLAVE.srcs/sources_1/bd/MCU/ip/MCU_clk_wiz_1_0/MCU_clk_wiz_1_0_stub.vhdl
-- Design      : MCU_clk_wiz_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MCU_clk_wiz_1_0 is
  Port ( 
    OCLK100 : out STD_LOGIC;
    OCLK10 : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end MCU_clk_wiz_1_0;

architecture stub of MCU_clk_wiz_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "OCLK100,OCLK10,locked,clk_in1";
begin
end;
