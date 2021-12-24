set_property SRC_FILE_INFO {cfile:C:/Xilinx/digilent-xdc-master/digilent-xdc-master/Cmod-A7-Master.xdc rfile:../../../../../../../../../../Xilinx/digilent-xdc-master/digilent-xdc-master/Cmod-A7-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { CLK }]; #IO_L12P_T1_MRCC_14 Sch=gclk
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 83.33 -waveform {0 41.66} [get_ports {CLK}];
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; #IO_L12N_T1_MRCC_16 Sch=led[1]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #IO_L13P_T2_MRCC_16 Sch=led[2]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { BTN[0] }]; #IO_L19N_T3_VREF_16 Sch=btn[0]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { BTN[1] }]; #IO_L19P_T3_16 Sch=btn[1]
