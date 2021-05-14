set_property SRC_FILE_INFO {cfile:c:/proj_VolumeDisplay/fpga/SONICSLAVE/SONICSLAVE.srcs/sources_1/ip/CLKGEN/CLKGEN.xdc rfile:../../../SONICSLAVE.srcs/sources_1/ip/CLKGEN/CLKGEN.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports ISYSCLK]] 0.83333
