vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/microblaze_v10_0_6
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/mdm_v3_2_13
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_12
vlib activehdl/lmb_v10_v3_0_9
vlib activehdl/lmb_bram_if_cntlr_v4_0_14
vlib activehdl/blk_mem_gen_v8_4_1
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_uartlite_v2_0_20
vlib activehdl/axi_intc_v4_1_10
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_16
vlib activehdl/fifo_generator_v13_2_2
vlib activehdl/axi_data_fifo_v2_1_15
vlib activehdl/axi_crossbar_v2_1_17

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap microblaze_v10_0_6 activehdl/microblaze_v10_0_6
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_13 activehdl/mdm_v3_2_13
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 activehdl/proc_sys_reset_v5_0_12
vmap lmb_v10_v3_0_9 activehdl/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_14 activehdl/lmb_bram_if_cntlr_v4_0_14
vmap blk_mem_gen_v8_4_1 activehdl/blk_mem_gen_v8_4_1
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_20 activehdl/axi_uartlite_v2_0_20
vmap axi_intc_v4_1_10 activehdl/axi_intc_v4_1_10
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_16 activehdl/axi_register_slice_v2_1_16
vmap fifo_generator_v13_2_2 activehdl/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_15 activehdl/axi_data_fifo_v2_1_15
vmap axi_crossbar_v2_1_17 activehdl/axi_crossbar_v2_1_17

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v10_0_6 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/6141/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/MCU/ip/MCU_microblaze_0_0/sim/MCU_microblaze_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_13 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/351e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/MCU/ip/MCU_mdm_1_0/sim/MCU_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../bd/MCU/ip/MCU_clk_wiz_1_0/MCU_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/MCU/ip/MCU_clk_wiz_1_0/MCU_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/MCU/ip/MCU_rst_clk_wiz_1_100M_0/sim/MCU_rst_clk_wiz_1_100M_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/MCU/ip/MCU_dlmb_v10_0/sim/MCU_dlmb_v10_0.vhd" \
"../../../bd/MCU/ip/MCU_ilmb_v10_0/sim/MCU_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_14 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/226d/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/MCU/ip/MCU_dlmb_bram_if_cntlr_0/sim/MCU_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/MCU/ip/MCU_ilmb_bram_if_cntlr_0/sim/MCU_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../bd/MCU/ip/MCU_lmb_bram_0/sim/MCU_lmb_bram_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_20 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/9945/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/MCU/ip/MCU_axi_uartlite_0_0/sim/MCU_axi_uartlite_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../bd/MCU/sim/MCU.v" \

vcom -work axi_intc_v4_1_10 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/cf04/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/MCU/ip/MCU_axi_intc_0_0/sim/MCU_axi_intc_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_16  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/0cde/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_15  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/d114/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_17  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/d293/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/4903" "+incdir+../../../../Display3D.srcs/sources_1/bd/MCU/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../bd/MCU/ip/MCU_xbar_0/sim/MCU_xbar_0.v" \
"../../../bd/MCU/ip/MCU_m01_data_fifo_0/sim/MCU_m01_data_fifo_0.v" \
"../../../bd/MCU/ip/MCU_m00_data_fifo_0/sim/MCU_m00_data_fifo_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

