# 
# Report generation script generated by Vivado
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
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a35tcpg236-1
  set_property board_part digilentinc.com:cmod_a7-35t:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/proj_sasaoka/Display3D/Display3D.cache/wt [current_project]
  set_property parent.project_path C:/proj_sasaoka/Display3D/Display3D.xpr [current_project]
  set_property ip_output_repo C:/proj_sasaoka/Display3D/Display3D.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/proj_sasaoka/Display3D/Display3D.runs/synth_1/FPGA_TOP.dcp
  set_msg_config -source 4 -id {BD 41-1661} -limit 0
  set_param project.isImplRun true
  add_files C:/proj_sasaoka/Display3D/Display3D.srcs/sources_1/bd/MCU/MCU.bd
  set_param project.isImplRun false
  read_xdc C:/proj_sasaoka/Display3D/Display3D.srcs/constrs_1/Cmod-A7.xdc
  set_param project.isImplRun true
  link_design -top FPGA_TOP -part xc7a35tcpg236-1
  set_param project.isImplRun false
  write_hwdef -force -file FPGA_TOP.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force FPGA_TOP_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file FPGA_TOP_drc_opted.rpt -pb FPGA_TOP_drc_opted.pb -rpx FPGA_TOP_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force FPGA_TOP_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file FPGA_TOP_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file FPGA_TOP_utilization_placed.rpt -pb FPGA_TOP_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file FPGA_TOP_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force FPGA_TOP_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file FPGA_TOP_drc_routed.rpt -pb FPGA_TOP_drc_routed.pb -rpx FPGA_TOP_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file FPGA_TOP_methodology_drc_routed.rpt -pb FPGA_TOP_methodology_drc_routed.pb -rpx FPGA_TOP_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file FPGA_TOP_power_routed.rpt -pb FPGA_TOP_power_summary_routed.pb -rpx FPGA_TOP_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file FPGA_TOP_route_status.rpt -pb FPGA_TOP_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file FPGA_TOP_timing_summary_routed.rpt -pb FPGA_TOP_timing_summary_routed.pb -rpx FPGA_TOP_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file FPGA_TOP_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file FPGA_TOP_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file route_report_bus_skew_0.rpt -rpx route_report_bus_skew_0.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force FPGA_TOP_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force FPGA_TOP.mmi }
  catch { write_bmm -force FPGA_TOP_bd.bmm }
  write_bitstream -force FPGA_TOP.bit 
  catch { write_sysdef -hwdef FPGA_TOP.hwdef -bitfile FPGA_TOP.bit -meminfo FPGA_TOP.mmi -file FPGA_TOP.sysdef }
  catch {write_debug_probes -quiet -force FPGA_TOP}
  catch {file copy -force FPGA_TOP.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

