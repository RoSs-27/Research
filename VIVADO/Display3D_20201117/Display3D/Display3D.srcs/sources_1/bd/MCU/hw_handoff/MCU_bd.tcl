
################################################################
# This is a generated script based on design: MCU
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source MCU_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
   set_property BOARD_PART digilentinc.com:cmod_a7-35t:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name MCU

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: localmem
proc create_hier_cell_localmem { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_localmem() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [ list \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set LED [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 LED ]
  set REVHW [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 REVHW ]
  set SW [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 SW ]
  set UART [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART ]

  # Create ports
  set IINTR [ create_bd_port -dir I IINTR ]
  set ISYSCLK [ create_bd_port -dir I -type clk ISYSCLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {12000000} \
 ] $ISYSCLK
  set ISYSRST [ create_bd_port -dir I -type rst ISYSRST ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $ISYSRST
  set ITIMER_CAP0 [ create_bd_port -dir I ITIMER_CAP0 ]
  set ITIMER_CAP1 [ create_bd_port -dir I ITIMER_CAP1 ]
  set ITIMER_FRZ [ create_bd_port -dir I ITIMER_FRZ ]
  set OCLK10 [ create_bd_port -dir O -type clk OCLK10 ]
  set OLOCKED [ create_bd_port -dir O OLOCKED ]
  set OPERI_RST [ create_bd_port -dir O -from 0 -to 0 OPERI_RST ]
  set OPERI_XRST [ create_bd_port -dir O -from 0 -to 0 OPERI_XRST ]
  set OTIMER_GEN0 [ create_bd_port -dir O OTIMER_GEN0 ]
  set OTIMER_GEN1 [ create_bd_port -dir O OTIMER_GEN1 ]
  set OTIMER_PWM [ create_bd_port -dir O OTIMER_PWM ]

  # Create instance: clkgen, and set properties
  set clkgen [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clkgen ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {833.33} \
   CONFIG.CLKIN2_JITTER_PS {100.0} \
   CONFIG.CLKOUT1_JITTER {479.872} \
   CONFIG.CLKOUT1_PHASE_ERROR {668.310} \
   CONFIG.CLKOUT2_JITTER {705.336} \
   CONFIG.CLKOUT2_PHASE_ERROR {668.310} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {10.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {202.114} \
   CONFIG.CLKOUT3_PHASE_ERROR {132.063} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT3_USED {false} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
   CONFIG.CLK_OUT1_PORT {OCLK100} \
   CONFIG.CLK_OUT2_PORT {OCLK10} \
   CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {62.500} \
   CONFIG.MMCM_CLKIN1_PERIOD {83.333} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {7.500} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {75} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {1} \
   CONFIG.MMCM_COMPENSATION {ZHOLD} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.PRIM_IN_FREQ {12.000} \
   CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.SECONDARY_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.USE_INCLK_SWITCHOVER {false} \
   CONFIG.USE_RESET {false} \
 ] $clkgen

  # Create instance: concat_intr, and set properties
  set concat_intr [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_intr ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $concat_intr

  # Create instance: conn, and set properties
  set conn [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 conn ]
  set_property -dict [ list \
   CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
   CONFIG.M00_HAS_DATA_FIFO {1} \
   CONFIG.M00_HAS_REGSLICE {3} \
   CONFIG.M01_HAS_DATA_FIFO {1} \
   CONFIG.M01_HAS_REGSLICE {3} \
   CONFIG.NUM_MI {5} \
 ] $conn

  # Create instance: gpio_ledsw, and set properties
  set gpio_ledsw [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 gpio_ledsw ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_ALL_INPUTS_2 {1} \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_ALL_OUTPUTS_2 {0} \
   CONFIG.C_GPIO2_WIDTH {8} \
   CONFIG.C_GPIO_WIDTH {8} \
   CONFIG.C_INTERRUPT_PRESENT {1} \
   CONFIG.C_IS_DUAL {1} \
 ] $gpio_ledsw

  # Create instance: gpio_revhw, and set properties
  set gpio_revhw [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 gpio_revhw ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {1} \
 ] $gpio_revhw

  # Create instance: intr, and set properties
  set intr [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 intr ]

  # Create instance: localmem
  create_hier_cell_localmem [current_bd_instance .] localmem

  # Create instance: mbcore, and set properties
  set mbcore [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:10.0 mbcore ]
  set_property -dict [ list \
   CONFIG.C_ADDR_TAG_BITS {0} \
   CONFIG.C_AREA_OPTIMIZED {0} \
   CONFIG.C_DCACHE_ADDR_TAG {0} \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_ICACHE_LINE_LEN {4} \
   CONFIG.C_I_LMB {1} \
   CONFIG.C_MMU_ZONES {16} \
   CONFIG.C_M_AXI_D_BUS_EXCEPTION {0} \
   CONFIG.C_NUMBER_OF_PC_BRK {1} \
   CONFIG.C_USE_BARREL {0} \
   CONFIG.C_USE_DCACHE {0} \
   CONFIG.C_USE_HW_MUL {0} \
   CONFIG.C_USE_ICACHE {0} \
   CONFIG.C_USE_MSR_INSTR {0} \
   CONFIG.C_USE_PCMP_INSTR {0} \
   CONFIG.G_TEMPLATE_LIST {0} \
   CONFIG.G_USE_EXCEPTIONS {0} \
 ] $mbcore

  # Create instance: mdm, and set properties
  set mdm [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm ]

  # Create instance: rstgen, and set properties
  set rstgen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rstgen ]

  # Create instance: timer, and set properties
  set timer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 timer ]
  set_property -dict [ list \
   CONFIG.enable_timer2 {1} \
 ] $timer

  # Create instance: uart, and set properties
  set uart [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 uart ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_intc_0_interrupt [get_bd_intf_pins intr/interrupt] [get_bd_intf_pins mbcore/INTERRUPT]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports UART] [get_bd_intf_pins uart/UART]
  connect_bd_intf_net -intf_net conn_M02_AXI [get_bd_intf_pins conn/M02_AXI] [get_bd_intf_pins gpio_ledsw/S_AXI]
  connect_bd_intf_net -intf_net conn_M03_AXI [get_bd_intf_pins conn/M03_AXI] [get_bd_intf_pins gpio_revhw/S_AXI]
  connect_bd_intf_net -intf_net conn_M04_AXI [get_bd_intf_pins conn/M04_AXI] [get_bd_intf_pins timer/S_AXI]
  connect_bd_intf_net -intf_net gpio_ledsw_GPIO2 [get_bd_intf_ports SW] [get_bd_intf_pins gpio_ledsw/GPIO2]
  connect_bd_intf_net -intf_net gpio_verhw_GPIO [get_bd_intf_ports REVHW] [get_bd_intf_pins gpio_revhw/GPIO]
  connect_bd_intf_net -intf_net interconnect_M00_AXI [get_bd_intf_pins conn/M00_AXI] [get_bd_intf_pins intr/s_axi]
  connect_bd_intf_net -intf_net interconnect_M01_AXI [get_bd_intf_pins conn/M01_AXI] [get_bd_intf_pins uart/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mbcore/DEBUG] [get_bd_intf_pins mdm/MBDEBUG_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins localmem/DLMB] [get_bd_intf_pins mbcore/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins localmem/ILMB] [get_bd_intf_pins mbcore/ILMB]
  connect_bd_intf_net -intf_net microblaze_M_AXI_DP [get_bd_intf_pins conn/S00_AXI] [get_bd_intf_pins mbcore/M_AXI_DP]
  connect_bd_intf_net -intf_net s_LED [get_bd_intf_ports LED] [get_bd_intf_pins gpio_ledsw/GPIO]

  # Create port connections
  connect_bd_net -net IINTR_1 [get_bd_ports IINTR] [get_bd_pins concat_intr/In3]
  connect_bd_net -net capturetrig0_0_1 [get_bd_ports ITIMER_CAP0] [get_bd_pins timer/capturetrig0]
  connect_bd_net -net capturetrig1_0_1 [get_bd_ports ITIMER_CAP1] [get_bd_pins timer/capturetrig1]
  connect_bd_net -net clkgen_OCLK10 [get_bd_ports OCLK10] [get_bd_pins clkgen/OCLK10] [get_bd_pins rstgen/slowest_sync_clk]
  connect_bd_net -net clkgen_locked [get_bd_ports OLOCKED] [get_bd_pins clkgen/locked] [get_bd_pins rstgen/dcm_locked]
  connect_bd_net -net concat_intr_dout [get_bd_pins concat_intr/dout] [get_bd_pins intr/intr]
  connect_bd_net -net freeze_0_1 [get_bd_ports ITIMER_FRZ] [get_bd_pins timer/freeze]
  connect_bd_net -net gpio_ledsw_ip2intc_irpt [get_bd_pins concat_intr/In2] [get_bd_pins gpio_ledsw/ip2intc_irpt]
  connect_bd_net -net interconnect_aresetn [get_bd_pins conn/ARESETN] [get_bd_pins conn/M00_ARESETN] [get_bd_pins conn/M01_ARESETN] [get_bd_pins conn/M02_ARESETN] [get_bd_pins conn/M03_ARESETN] [get_bd_pins conn/M04_ARESETN] [get_bd_pins conn/S00_ARESETN] [get_bd_pins rstgen/interconnect_aresetn]
  connect_bd_net -net mb_reset [get_bd_pins mbcore/Reset] [get_bd_pins rstgen/mb_reset]
  connect_bd_net -net mbcore_Clk [get_bd_pins clkgen/OCLK100] [get_bd_pins conn/ACLK] [get_bd_pins conn/M00_ACLK] [get_bd_pins conn/M01_ACLK] [get_bd_pins conn/M02_ACLK] [get_bd_pins conn/M03_ACLK] [get_bd_pins conn/M04_ACLK] [get_bd_pins conn/S00_ACLK] [get_bd_pins gpio_ledsw/s_axi_aclk] [get_bd_pins gpio_revhw/s_axi_aclk] [get_bd_pins intr/s_axi_aclk] [get_bd_pins localmem/LMB_Clk] [get_bd_pins mbcore/Clk] [get_bd_pins timer/s_axi_aclk] [get_bd_pins uart/s_axi_aclk]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm/Debug_SYS_Rst] [get_bd_pins rstgen/mb_debug_sys_rst]
  connect_bd_net -net peripheral_aresetn [get_bd_ports OPERI_XRST] [get_bd_pins gpio_ledsw/s_axi_aresetn] [get_bd_pins gpio_revhw/s_axi_aresetn] [get_bd_pins intr/s_axi_aresetn] [get_bd_pins rstgen/peripheral_aresetn] [get_bd_pins timer/s_axi_aresetn] [get_bd_pins uart/s_axi_aresetn]
  connect_bd_net -net reset_0_1 [get_bd_ports ISYSRST] [get_bd_pins rstgen/ext_reset_in]
  connect_bd_net -net rstgen_peripheral_reset [get_bd_ports OPERI_RST] [get_bd_pins rstgen/peripheral_reset]
  connect_bd_net -net s_sysclk [get_bd_ports ISYSCLK] [get_bd_pins clkgen/clk_in1]
  connect_bd_net -net struct_reset [get_bd_pins localmem/SYS_Rst] [get_bd_pins rstgen/bus_struct_reset]
  connect_bd_net -net timer_generateout0 [get_bd_ports OTIMER_GEN0] [get_bd_pins timer/generateout0]
  connect_bd_net -net timer_generateout1 [get_bd_ports OTIMER_GEN1] [get_bd_pins timer/generateout1]
  connect_bd_net -net timer_interrupt [get_bd_pins concat_intr/In1] [get_bd_pins timer/interrupt]
  connect_bd_net -net timer_pwm0 [get_bd_ports OTIMER_PWM] [get_bd_pins timer/pwm0]
  connect_bd_net -net uart_interrupt [get_bd_pins concat_intr/In0] [get_bd_pins uart/interrupt]

  # Create address segments
  create_bd_addr_seg -range 0x00008000 -offset 0x00000000 [get_bd_addr_spaces mbcore/Data] [get_bd_addr_segs localmem/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x03000000 [get_bd_addr_spaces mbcore/Data] [get_bd_addr_segs gpio_ledsw/S_AXI/Reg] SEG_gpio_led_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x04000000 [get_bd_addr_spaces mbcore/Data] [get_bd_addr_segs gpio_revhw/S_AXI/Reg] SEG_gpio_revhw_Reg
  create_bd_addr_seg -range 0x00008000 -offset 0x00000000 [get_bd_addr_spaces mbcore/Instruction] [get_bd_addr_segs localmem/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x01000000 [get_bd_addr_spaces mbcore/Data] [get_bd_addr_segs intr/S_AXI/Reg] SEG_intr_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x05000000 [get_bd_addr_spaces mbcore/Data] [get_bd_addr_segs timer/S_AXI/Reg] SEG_timer_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x02000000 [get_bd_addr_spaces mbcore/Data] [get_bd_addr_segs uart/S_AXI/Reg] SEG_uart_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


