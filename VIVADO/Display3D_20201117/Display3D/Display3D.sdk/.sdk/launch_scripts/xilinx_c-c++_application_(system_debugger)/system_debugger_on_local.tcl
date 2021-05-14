connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Cmod A7 - 35T 210328A6D9E7A" && level==0} -index 0
fpga -file C:/proj_sasaoka/Display3D/Display3D.sdk/FPGA_TOP_hw_platform_0/FPGA_TOP.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Cmod A7 - 35T 210328A6D9E7A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Cmod A7 - 35T 210328A6D9E7A"} -index 0
dow C:/proj_sasaoka/Display3D/Display3D.sdk/DISP3D/Debug/DISP3D.elf
bpadd -addr &main
