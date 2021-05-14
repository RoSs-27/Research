# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.cache/wt [current_project]
set_property parent.project_path C:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths C:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7-35T-OOB-2018.2-1/vivado_proj/Cmod-A7-35T-OOB.board [current_project]
set_property board_part digilentinc.com:cmod_a7-35t:part0:1.1 [current_project]
set_property ip_repo_paths c:/Users/b183r035m/Documents/repo [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/imports/hdl/user_35t_wrapper.v
add_files C:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/user_35t.bd
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_emc_0_0/user_35t_axi_emc_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_emc_0_0/user_35t_axi_emc_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_emc_0_0/user_35t_axi_emc_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_gpio_0_0/user_35t_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_gpio_0_0/user_35t_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_gpio_0_0/user_35t_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_gpio_1_0/user_35t_axi_gpio_1_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_gpio_1_0/user_35t_axi_gpio_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_gpio_1_0/user_35t_axi_gpio_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_intc_0_0/user_35t_axi_intc_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_intc_0_0/user_35t_axi_intc_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_intc_0_0/user_35t_axi_intc_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_timer_0_0/user_35t_axi_timer_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_timer_0_0/user_35t_axi_timer_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_uartlite_0_0/user_35t_axi_uartlite_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_uartlite_0_0/user_35t_axi_uartlite_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_axi_uartlite_0_0/user_35t_axi_uartlite_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_clk_wiz_0_0/user_35t_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_clk_wiz_0_0/user_35t_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_clk_wiz_0_0/user_35t_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_mdm_1_0/user_35t_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_mdm_1_0/user_35t_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_microblaze_0_0/user_35t_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_microblaze_0_0/user_35t_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_microblaze_0_0/user_35t_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_rst_clk_wiz_0_100M_0/user_35t_rst_clk_wiz_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_rst_clk_wiz_0_100M_0/user_35t_rst_clk_wiz_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_rst_clk_wiz_0_100M_0/user_35t_rst_clk_wiz_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_dlmb_bram_if_cntlr_0/user_35t_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_dlmb_v10_0/user_35t_dlmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_dlmb_v10_0/user_35t_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_ilmb_bram_if_cntlr_0/user_35t_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_ilmb_v10_0/user_35t_ilmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_ilmb_v10_0/user_35t_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_lmb_bram_0/user_35t_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_xbar_1/user_35t_xbar_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_xbar_0/user_35t_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_m00_data_fifo_0/user_35t_m00_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_m00_regslice_0/user_35t_m00_regslice_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_m00_regslice_0/user_35t_m00_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_s01_regslice_0/user_35t_s01_regslice_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_s01_regslice_0/user_35t_s01_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_s01_data_fifo_0/user_35t_s01_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_s00_regslice_0/user_35t_s00_regslice_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_s00_regslice_0/user_35t_s00_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/ip/user_35t_s00_data_fifo_0/user_35t_s00_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/b183r035m/Documents/workspace/VIVADO/Cmod-A7_OOB/Cmod-A7_OOB.srcs/sources_1/bd/user_35t/user_35t_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top user_35t_wrapper -part xc7a35tcpg236-1 -flatten_hierarchy none -directive RuntimeOptimized -fsm_extraction off


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef user_35t_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file user_35t_wrapper_utilization_synth.rpt -pb user_35t_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
