//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Tue Nov 17 15:56:15 2020
//Host        : Parasha running 64-bit major release  (build 9200)
//Command     : generate_target MCU.bd
//Design      : MCU
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "MCU,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=MCU,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=26,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=8,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_mb_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "MCU.hwdef" *) 
module MCU
   (IINTR,
    ISYSCLK,
    ISYSRST,
    ITIMER_CAP0,
    ITIMER_CAP1,
    ITIMER_FRZ,
    LED_tri_o,
    OCLK10,
    OLOCKED,
    OPERI_RST,
    OPERI_XRST,
    OTIMER_GEN0,
    OTIMER_GEN1,
    OTIMER_PWM,
    REVHW_tri_i,
    SW_tri_i,
    UART_rxd,
    UART_txd);
  input IINTR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ISYSCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ISYSCLK, CLK_DOMAIN MCU_ISYSCLK, FREQ_HZ 12000000, PHASE 0.000" *) input ISYSCLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ISYSRST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ISYSRST, POLARITY ACTIVE_HIGH" *) input ISYSRST;
  input ITIMER_CAP0;
  input ITIMER_CAP1;
  input ITIMER_FRZ;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 LED TRI_O" *) output [7:0]LED_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.OCLK10 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.OCLK10, CLK_DOMAIN /clkgen_clk_out1, FREQ_HZ 10000000, PHASE 0.0" *) output OCLK10;
  output OLOCKED;
  output [0:0]OPERI_RST;
  output [0:0]OPERI_XRST;
  output OTIMER_GEN0;
  output OTIMER_GEN1;
  output OTIMER_PWM;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 REVHW TRI_I" *) input [31:0]REVHW_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 SW " *) input [7:0]SW_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART RxD" *) input UART_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART TxD" *) output UART_txd;

  wire IINTR_1;
  wire axi_intc_0_interrupt_INTERRUPT;
  wire axi_uartlite_0_UART_RxD;
  wire axi_uartlite_0_UART_TxD;
  wire capturetrig0_0_1;
  wire capturetrig1_0_1;
  wire clkgen_OCLK10;
  wire clkgen_locked;
  wire [3:0]concat_intr_dout;
  wire [31:0]conn_M02_AXI_ARADDR;
  wire conn_M02_AXI_ARREADY;
  wire conn_M02_AXI_ARVALID;
  wire [31:0]conn_M02_AXI_AWADDR;
  wire conn_M02_AXI_AWREADY;
  wire conn_M02_AXI_AWVALID;
  wire conn_M02_AXI_BREADY;
  wire [1:0]conn_M02_AXI_BRESP;
  wire conn_M02_AXI_BVALID;
  wire [31:0]conn_M02_AXI_RDATA;
  wire conn_M02_AXI_RREADY;
  wire [1:0]conn_M02_AXI_RRESP;
  wire conn_M02_AXI_RVALID;
  wire [31:0]conn_M02_AXI_WDATA;
  wire conn_M02_AXI_WREADY;
  wire [3:0]conn_M02_AXI_WSTRB;
  wire conn_M02_AXI_WVALID;
  wire [31:0]conn_M03_AXI_ARADDR;
  wire conn_M03_AXI_ARREADY;
  wire conn_M03_AXI_ARVALID;
  wire [31:0]conn_M03_AXI_AWADDR;
  wire conn_M03_AXI_AWREADY;
  wire conn_M03_AXI_AWVALID;
  wire conn_M03_AXI_BREADY;
  wire [1:0]conn_M03_AXI_BRESP;
  wire conn_M03_AXI_BVALID;
  wire [31:0]conn_M03_AXI_RDATA;
  wire conn_M03_AXI_RREADY;
  wire [1:0]conn_M03_AXI_RRESP;
  wire conn_M03_AXI_RVALID;
  wire [31:0]conn_M03_AXI_WDATA;
  wire conn_M03_AXI_WREADY;
  wire [3:0]conn_M03_AXI_WSTRB;
  wire conn_M03_AXI_WVALID;
  wire [31:0]conn_M04_AXI_ARADDR;
  wire conn_M04_AXI_ARREADY;
  wire conn_M04_AXI_ARVALID;
  wire [31:0]conn_M04_AXI_AWADDR;
  wire conn_M04_AXI_AWREADY;
  wire conn_M04_AXI_AWVALID;
  wire conn_M04_AXI_BREADY;
  wire [1:0]conn_M04_AXI_BRESP;
  wire conn_M04_AXI_BVALID;
  wire [31:0]conn_M04_AXI_RDATA;
  wire conn_M04_AXI_RREADY;
  wire [1:0]conn_M04_AXI_RRESP;
  wire conn_M04_AXI_RVALID;
  wire [31:0]conn_M04_AXI_WDATA;
  wire conn_M04_AXI_WREADY;
  wire [3:0]conn_M04_AXI_WSTRB;
  wire conn_M04_AXI_WVALID;
  wire freeze_0_1;
  wire [7:0]gpio_ledsw_GPIO2_TRI_I;
  wire gpio_ledsw_ip2intc_irpt;
  wire [31:0]gpio_verhw_GPIO_TRI_I;
  wire [8:0]interconnect_M00_AXI_ARADDR;
  wire interconnect_M00_AXI_ARREADY;
  wire interconnect_M00_AXI_ARVALID;
  wire [8:0]interconnect_M00_AXI_AWADDR;
  wire interconnect_M00_AXI_AWREADY;
  wire interconnect_M00_AXI_AWVALID;
  wire interconnect_M00_AXI_BREADY;
  wire [1:0]interconnect_M00_AXI_BRESP;
  wire interconnect_M00_AXI_BVALID;
  wire [31:0]interconnect_M00_AXI_RDATA;
  wire interconnect_M00_AXI_RREADY;
  wire [1:0]interconnect_M00_AXI_RRESP;
  wire interconnect_M00_AXI_RVALID;
  wire [31:0]interconnect_M00_AXI_WDATA;
  wire interconnect_M00_AXI_WREADY;
  wire [3:0]interconnect_M00_AXI_WSTRB;
  wire interconnect_M00_AXI_WVALID;
  wire [3:0]interconnect_M01_AXI_ARADDR;
  wire interconnect_M01_AXI_ARREADY;
  wire interconnect_M01_AXI_ARVALID;
  wire [3:0]interconnect_M01_AXI_AWADDR;
  wire interconnect_M01_AXI_AWREADY;
  wire interconnect_M01_AXI_AWVALID;
  wire interconnect_M01_AXI_BREADY;
  wire [1:0]interconnect_M01_AXI_BRESP;
  wire interconnect_M01_AXI_BVALID;
  wire [31:0]interconnect_M01_AXI_RDATA;
  wire interconnect_M01_AXI_RREADY;
  wire [1:0]interconnect_M01_AXI_RRESP;
  wire interconnect_M01_AXI_RVALID;
  wire [31:0]interconnect_M01_AXI_WDATA;
  wire interconnect_M01_AXI_WREADY;
  wire [3:0]interconnect_M01_AXI_WSTRB;
  wire interconnect_M01_AXI_WVALID;
  wire [0:0]interconnect_aresetn;
  wire mb_reset;
  wire mbcore_Clk;
  wire mdm_1_debug_sys_rst;
  wire microblaze_0_debug_CAPTURE;
  wire microblaze_0_debug_CLK;
  wire microblaze_0_debug_DISABLE;
  wire [0:7]microblaze_0_debug_REG_EN;
  wire microblaze_0_debug_RST;
  wire microblaze_0_debug_SHIFT;
  wire microblaze_0_debug_TDI;
  wire microblaze_0_debug_TDO;
  wire microblaze_0_debug_UPDATE;
  wire [0:31]microblaze_0_dlmb_1_ABUS;
  wire microblaze_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_1_BE;
  wire microblaze_0_dlmb_1_CE;
  wire [0:31]microblaze_0_dlmb_1_READDBUS;
  wire microblaze_0_dlmb_1_READSTROBE;
  wire microblaze_0_dlmb_1_READY;
  wire microblaze_0_dlmb_1_UE;
  wire microblaze_0_dlmb_1_WAIT;
  wire [0:31]microblaze_0_dlmb_1_WRITEDBUS;
  wire microblaze_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_1_ABUS;
  wire microblaze_0_ilmb_1_ADDRSTROBE;
  wire microblaze_0_ilmb_1_CE;
  wire [0:31]microblaze_0_ilmb_1_READDBUS;
  wire microblaze_0_ilmb_1_READSTROBE;
  wire microblaze_0_ilmb_1_READY;
  wire microblaze_0_ilmb_1_UE;
  wire microblaze_0_ilmb_1_WAIT;
  wire [31:0]microblaze_M_AXI_DP_ARADDR;
  wire [2:0]microblaze_M_AXI_DP_ARPROT;
  wire [0:0]microblaze_M_AXI_DP_ARREADY;
  wire microblaze_M_AXI_DP_ARVALID;
  wire [31:0]microblaze_M_AXI_DP_AWADDR;
  wire [2:0]microblaze_M_AXI_DP_AWPROT;
  wire [0:0]microblaze_M_AXI_DP_AWREADY;
  wire microblaze_M_AXI_DP_AWVALID;
  wire microblaze_M_AXI_DP_BREADY;
  wire [1:0]microblaze_M_AXI_DP_BRESP;
  wire [0:0]microblaze_M_AXI_DP_BVALID;
  wire [31:0]microblaze_M_AXI_DP_RDATA;
  wire microblaze_M_AXI_DP_RREADY;
  wire [1:0]microblaze_M_AXI_DP_RRESP;
  wire [0:0]microblaze_M_AXI_DP_RVALID;
  wire [31:0]microblaze_M_AXI_DP_WDATA;
  wire [0:0]microblaze_M_AXI_DP_WREADY;
  wire [3:0]microblaze_M_AXI_DP_WSTRB;
  wire microblaze_M_AXI_DP_WVALID;
  wire [0:0]peripheral_aresetn;
  wire reset_0_1;
  wire [0:0]rstgen_peripheral_reset;
  wire [7:0]s_LED_TRI_O;
  wire s_sysclk;
  wire [0:0]struct_reset;
  wire timer_generateout0;
  wire timer_generateout1;
  wire timer_interrupt;
  wire timer_pwm0;
  wire uart_interrupt;

  assign IINTR_1 = IINTR;
  assign LED_tri_o[7:0] = s_LED_TRI_O;
  assign OCLK10 = clkgen_OCLK10;
  assign OLOCKED = clkgen_locked;
  assign OPERI_RST[0] = rstgen_peripheral_reset;
  assign OPERI_XRST[0] = peripheral_aresetn;
  assign OTIMER_GEN0 = timer_generateout0;
  assign OTIMER_GEN1 = timer_generateout1;
  assign OTIMER_PWM = timer_pwm0;
  assign UART_txd = axi_uartlite_0_UART_TxD;
  assign axi_uartlite_0_UART_RxD = UART_rxd;
  assign capturetrig0_0_1 = ITIMER_CAP0;
  assign capturetrig1_0_1 = ITIMER_CAP1;
  assign freeze_0_1 = ITIMER_FRZ;
  assign gpio_ledsw_GPIO2_TRI_I = SW_tri_i[7:0];
  assign gpio_verhw_GPIO_TRI_I = REVHW_tri_i[31:0];
  assign reset_0_1 = ISYSRST;
  assign s_sysclk = ISYSCLK;
  MCU_clk_wiz_1_0 clkgen
       (.OCLK10(clkgen_OCLK10),
        .OCLK100(mbcore_Clk),
        .clk_in1(s_sysclk),
        .locked(clkgen_locked));
  MCU_xlconcat_0_0 concat_intr
       (.In0(uart_interrupt),
        .In1(timer_interrupt),
        .In2(gpio_ledsw_ip2intc_irpt),
        .In3(IINTR_1),
        .dout(concat_intr_dout));
  MCU_axi_interconnect_0_0 conn
       (.ACLK(mbcore_Clk),
        .ARESETN(interconnect_aresetn),
        .M00_ACLK(mbcore_Clk),
        .M00_ARESETN(interconnect_aresetn),
        .M00_AXI_araddr(interconnect_M00_AXI_ARADDR),
        .M00_AXI_arready(interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(interconnect_M00_AXI_AWADDR),
        .M00_AXI_awready(interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(interconnect_M00_AXI_WVALID),
        .M01_ACLK(mbcore_Clk),
        .M01_ARESETN(interconnect_aresetn),
        .M01_AXI_araddr(interconnect_M01_AXI_ARADDR),
        .M01_AXI_arready(interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(interconnect_M01_AXI_AWADDR),
        .M01_AXI_awready(interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(interconnect_M01_AXI_WVALID),
        .M02_ACLK(mbcore_Clk),
        .M02_ARESETN(interconnect_aresetn),
        .M02_AXI_araddr(conn_M02_AXI_ARADDR),
        .M02_AXI_arready(conn_M02_AXI_ARREADY),
        .M02_AXI_arvalid(conn_M02_AXI_ARVALID),
        .M02_AXI_awaddr(conn_M02_AXI_AWADDR),
        .M02_AXI_awready(conn_M02_AXI_AWREADY),
        .M02_AXI_awvalid(conn_M02_AXI_AWVALID),
        .M02_AXI_bready(conn_M02_AXI_BREADY),
        .M02_AXI_bresp(conn_M02_AXI_BRESP),
        .M02_AXI_bvalid(conn_M02_AXI_BVALID),
        .M02_AXI_rdata(conn_M02_AXI_RDATA),
        .M02_AXI_rready(conn_M02_AXI_RREADY),
        .M02_AXI_rresp(conn_M02_AXI_RRESP),
        .M02_AXI_rvalid(conn_M02_AXI_RVALID),
        .M02_AXI_wdata(conn_M02_AXI_WDATA),
        .M02_AXI_wready(conn_M02_AXI_WREADY),
        .M02_AXI_wstrb(conn_M02_AXI_WSTRB),
        .M02_AXI_wvalid(conn_M02_AXI_WVALID),
        .M03_ACLK(mbcore_Clk),
        .M03_ARESETN(interconnect_aresetn),
        .M03_AXI_araddr(conn_M03_AXI_ARADDR),
        .M03_AXI_arready(conn_M03_AXI_ARREADY),
        .M03_AXI_arvalid(conn_M03_AXI_ARVALID),
        .M03_AXI_awaddr(conn_M03_AXI_AWADDR),
        .M03_AXI_awready(conn_M03_AXI_AWREADY),
        .M03_AXI_awvalid(conn_M03_AXI_AWVALID),
        .M03_AXI_bready(conn_M03_AXI_BREADY),
        .M03_AXI_bresp(conn_M03_AXI_BRESP),
        .M03_AXI_bvalid(conn_M03_AXI_BVALID),
        .M03_AXI_rdata(conn_M03_AXI_RDATA),
        .M03_AXI_rready(conn_M03_AXI_RREADY),
        .M03_AXI_rresp(conn_M03_AXI_RRESP),
        .M03_AXI_rvalid(conn_M03_AXI_RVALID),
        .M03_AXI_wdata(conn_M03_AXI_WDATA),
        .M03_AXI_wready(conn_M03_AXI_WREADY),
        .M03_AXI_wstrb(conn_M03_AXI_WSTRB),
        .M03_AXI_wvalid(conn_M03_AXI_WVALID),
        .M04_ACLK(mbcore_Clk),
        .M04_ARESETN(interconnect_aresetn),
        .M04_AXI_araddr(conn_M04_AXI_ARADDR),
        .M04_AXI_arready(conn_M04_AXI_ARREADY),
        .M04_AXI_arvalid(conn_M04_AXI_ARVALID),
        .M04_AXI_awaddr(conn_M04_AXI_AWADDR),
        .M04_AXI_awready(conn_M04_AXI_AWREADY),
        .M04_AXI_awvalid(conn_M04_AXI_AWVALID),
        .M04_AXI_bready(conn_M04_AXI_BREADY),
        .M04_AXI_bresp(conn_M04_AXI_BRESP),
        .M04_AXI_bvalid(conn_M04_AXI_BVALID),
        .M04_AXI_rdata(conn_M04_AXI_RDATA),
        .M04_AXI_rready(conn_M04_AXI_RREADY),
        .M04_AXI_rresp(conn_M04_AXI_RRESP),
        .M04_AXI_rvalid(conn_M04_AXI_RVALID),
        .M04_AXI_wdata(conn_M04_AXI_WDATA),
        .M04_AXI_wready(conn_M04_AXI_WREADY),
        .M04_AXI_wstrb(conn_M04_AXI_WSTRB),
        .M04_AXI_wvalid(conn_M04_AXI_WVALID),
        .S00_ACLK(mbcore_Clk),
        .S00_ARESETN(interconnect_aresetn),
        .S00_AXI_araddr(microblaze_M_AXI_DP_ARADDR),
        .S00_AXI_arprot(microblaze_M_AXI_DP_ARPROT),
        .S00_AXI_arready(microblaze_M_AXI_DP_ARREADY),
        .S00_AXI_arvalid(microblaze_M_AXI_DP_ARVALID),
        .S00_AXI_awaddr(microblaze_M_AXI_DP_AWADDR),
        .S00_AXI_awprot(microblaze_M_AXI_DP_AWPROT),
        .S00_AXI_awready(microblaze_M_AXI_DP_AWREADY),
        .S00_AXI_awvalid(microblaze_M_AXI_DP_AWVALID),
        .S00_AXI_bready(microblaze_M_AXI_DP_BREADY),
        .S00_AXI_bresp(microblaze_M_AXI_DP_BRESP),
        .S00_AXI_bvalid(microblaze_M_AXI_DP_BVALID),
        .S00_AXI_rdata(microblaze_M_AXI_DP_RDATA),
        .S00_AXI_rready(microblaze_M_AXI_DP_RREADY),
        .S00_AXI_rresp(microblaze_M_AXI_DP_RRESP),
        .S00_AXI_rvalid(microblaze_M_AXI_DP_RVALID),
        .S00_AXI_wdata(microblaze_M_AXI_DP_WDATA),
        .S00_AXI_wready(microblaze_M_AXI_DP_WREADY),
        .S00_AXI_wstrb(microblaze_M_AXI_DP_WSTRB),
        .S00_AXI_wvalid(microblaze_M_AXI_DP_WVALID));
  MCU_axi_gpio_0_0 gpio_ledsw
       (.gpio2_io_i(gpio_ledsw_GPIO2_TRI_I),
        .gpio_io_o(s_LED_TRI_O),
        .ip2intc_irpt(gpio_ledsw_ip2intc_irpt),
        .s_axi_aclk(mbcore_Clk),
        .s_axi_araddr(conn_M02_AXI_ARADDR[8:0]),
        .s_axi_aresetn(peripheral_aresetn),
        .s_axi_arready(conn_M02_AXI_ARREADY),
        .s_axi_arvalid(conn_M02_AXI_ARVALID),
        .s_axi_awaddr(conn_M02_AXI_AWADDR[8:0]),
        .s_axi_awready(conn_M02_AXI_AWREADY),
        .s_axi_awvalid(conn_M02_AXI_AWVALID),
        .s_axi_bready(conn_M02_AXI_BREADY),
        .s_axi_bresp(conn_M02_AXI_BRESP),
        .s_axi_bvalid(conn_M02_AXI_BVALID),
        .s_axi_rdata(conn_M02_AXI_RDATA),
        .s_axi_rready(conn_M02_AXI_RREADY),
        .s_axi_rresp(conn_M02_AXI_RRESP),
        .s_axi_rvalid(conn_M02_AXI_RVALID),
        .s_axi_wdata(conn_M02_AXI_WDATA),
        .s_axi_wready(conn_M02_AXI_WREADY),
        .s_axi_wstrb(conn_M02_AXI_WSTRB),
        .s_axi_wvalid(conn_M02_AXI_WVALID));
  MCU_axi_gpio_0_1 gpio_revhw
       (.gpio_io_i(gpio_verhw_GPIO_TRI_I),
        .s_axi_aclk(mbcore_Clk),
        .s_axi_araddr(conn_M03_AXI_ARADDR[8:0]),
        .s_axi_aresetn(peripheral_aresetn),
        .s_axi_arready(conn_M03_AXI_ARREADY),
        .s_axi_arvalid(conn_M03_AXI_ARVALID),
        .s_axi_awaddr(conn_M03_AXI_AWADDR[8:0]),
        .s_axi_awready(conn_M03_AXI_AWREADY),
        .s_axi_awvalid(conn_M03_AXI_AWVALID),
        .s_axi_bready(conn_M03_AXI_BREADY),
        .s_axi_bresp(conn_M03_AXI_BRESP),
        .s_axi_bvalid(conn_M03_AXI_BVALID),
        .s_axi_rdata(conn_M03_AXI_RDATA),
        .s_axi_rready(conn_M03_AXI_RREADY),
        .s_axi_rresp(conn_M03_AXI_RRESP),
        .s_axi_rvalid(conn_M03_AXI_RVALID),
        .s_axi_wdata(conn_M03_AXI_WDATA),
        .s_axi_wready(conn_M03_AXI_WREADY),
        .s_axi_wstrb(conn_M03_AXI_WSTRB),
        .s_axi_wvalid(conn_M03_AXI_WVALID));
  MCU_axi_intc_0_0 intr
       (.intr(concat_intr_dout),
        .irq(axi_intc_0_interrupt_INTERRUPT),
        .s_axi_aclk(mbcore_Clk),
        .s_axi_araddr(interconnect_M00_AXI_ARADDR),
        .s_axi_aresetn(peripheral_aresetn),
        .s_axi_arready(interconnect_M00_AXI_ARREADY),
        .s_axi_arvalid(interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(interconnect_M00_AXI_AWADDR),
        .s_axi_awready(interconnect_M00_AXI_AWREADY),
        .s_axi_awvalid(interconnect_M00_AXI_AWVALID),
        .s_axi_bready(interconnect_M00_AXI_BREADY),
        .s_axi_bresp(interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(interconnect_M00_AXI_BVALID),
        .s_axi_rdata(interconnect_M00_AXI_RDATA),
        .s_axi_rready(interconnect_M00_AXI_RREADY),
        .s_axi_rresp(interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(interconnect_M00_AXI_RVALID),
        .s_axi_wdata(interconnect_M00_AXI_WDATA),
        .s_axi_wready(interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(interconnect_M00_AXI_WVALID));
  localmem_imp_1K21ZZS localmem
       (.DLMB_abus(microblaze_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_0_dlmb_1_BE),
        .DLMB_ce(microblaze_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_0_dlmb_1_READY),
        .DLMB_ue(microblaze_0_dlmb_1_UE),
        .DLMB_wait(microblaze_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_0_ilmb_1_READY),
        .ILMB_ue(microblaze_0_ilmb_1_UE),
        .ILMB_wait(microblaze_0_ilmb_1_WAIT),
        .LMB_Clk(mbcore_Clk),
        .SYS_Rst(struct_reset));
  (* BMM_INFO_PROCESSOR = "microblaze-le > MCU localmem/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  MCU_microblaze_0_0 mbcore
       (.Byte_Enable(microblaze_0_dlmb_1_BE),
        .Clk(mbcore_Clk),
        .DCE(microblaze_0_dlmb_1_CE),
        .DReady(microblaze_0_dlmb_1_READY),
        .DUE(microblaze_0_dlmb_1_UE),
        .DWait(microblaze_0_dlmb_1_WAIT),
        .D_AS(microblaze_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_0_dlmb_1_ABUS),
        .Data_Read(microblaze_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_0_debug_CLK),
        .Dbg_Disable(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_0_debug_REG_EN),
        .Dbg_Shift(microblaze_0_debug_SHIFT),
        .Dbg_TDI(microblaze_0_debug_TDI),
        .Dbg_TDO(microblaze_0_debug_TDO),
        .Dbg_Update(microblaze_0_debug_UPDATE),
        .Debug_Rst(microblaze_0_debug_RST),
        .ICE(microblaze_0_ilmb_1_CE),
        .IFetch(microblaze_0_ilmb_1_READSTROBE),
        .IReady(microblaze_0_ilmb_1_READY),
        .IUE(microblaze_0_ilmb_1_UE),
        .IWAIT(microblaze_0_ilmb_1_WAIT),
        .I_AS(microblaze_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_0_ilmb_1_ABUS),
        .Interrupt(axi_intc_0_interrupt_INTERRUPT),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_DP_ARADDR(microblaze_M_AXI_DP_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_M_AXI_DP_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_M_AXI_DP_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_M_AXI_DP_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_M_AXI_DP_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_M_AXI_DP_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_M_AXI_DP_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_M_AXI_DP_AWVALID),
        .M_AXI_DP_BREADY(microblaze_M_AXI_DP_BREADY),
        .M_AXI_DP_BRESP(microblaze_M_AXI_DP_BRESP),
        .M_AXI_DP_BVALID(microblaze_M_AXI_DP_BVALID),
        .M_AXI_DP_RDATA(microblaze_M_AXI_DP_RDATA),
        .M_AXI_DP_RREADY(microblaze_M_AXI_DP_RREADY),
        .M_AXI_DP_RRESP(microblaze_M_AXI_DP_RRESP),
        .M_AXI_DP_RVALID(microblaze_M_AXI_DP_RVALID),
        .M_AXI_DP_WDATA(microblaze_M_AXI_DP_WDATA),
        .M_AXI_DP_WREADY(microblaze_M_AXI_DP_WREADY),
        .M_AXI_DP_WSTRB(microblaze_M_AXI_DP_WSTRB),
        .M_AXI_DP_WVALID(microblaze_M_AXI_DP_WVALID),
        .Read_Strobe(microblaze_0_dlmb_1_READSTROBE),
        .Reset(mb_reset),
        .Write_Strobe(microblaze_0_dlmb_1_WRITESTROBE));
  MCU_mdm_1_0 mdm
       (.Dbg_Capture_0(microblaze_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_0_debug_CLK),
        .Dbg_Disable_0(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_0_debug_RST),
        .Dbg_Shift_0(microblaze_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_0_debug_TDI),
        .Dbg_TDO_0(microblaze_0_debug_TDO),
        .Dbg_Update_0(microblaze_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst));
  MCU_rst_clk_wiz_1_100M_0 rstgen
       (.aux_reset_in(1'b1),
        .bus_struct_reset(struct_reset),
        .dcm_locked(clkgen_locked),
        .ext_reset_in(reset_0_1),
        .interconnect_aresetn(interconnect_aresetn),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(mb_reset),
        .peripheral_aresetn(peripheral_aresetn),
        .peripheral_reset(rstgen_peripheral_reset),
        .slowest_sync_clk(clkgen_OCLK10));
  MCU_axi_timer_0_0 timer
       (.capturetrig0(capturetrig0_0_1),
        .capturetrig1(capturetrig1_0_1),
        .freeze(freeze_0_1),
        .generateout0(timer_generateout0),
        .generateout1(timer_generateout1),
        .interrupt(timer_interrupt),
        .pwm0(timer_pwm0),
        .s_axi_aclk(mbcore_Clk),
        .s_axi_araddr(conn_M04_AXI_ARADDR[4:0]),
        .s_axi_aresetn(peripheral_aresetn),
        .s_axi_arready(conn_M04_AXI_ARREADY),
        .s_axi_arvalid(conn_M04_AXI_ARVALID),
        .s_axi_awaddr(conn_M04_AXI_AWADDR[4:0]),
        .s_axi_awready(conn_M04_AXI_AWREADY),
        .s_axi_awvalid(conn_M04_AXI_AWVALID),
        .s_axi_bready(conn_M04_AXI_BREADY),
        .s_axi_bresp(conn_M04_AXI_BRESP),
        .s_axi_bvalid(conn_M04_AXI_BVALID),
        .s_axi_rdata(conn_M04_AXI_RDATA),
        .s_axi_rready(conn_M04_AXI_RREADY),
        .s_axi_rresp(conn_M04_AXI_RRESP),
        .s_axi_rvalid(conn_M04_AXI_RVALID),
        .s_axi_wdata(conn_M04_AXI_WDATA),
        .s_axi_wready(conn_M04_AXI_WREADY),
        .s_axi_wstrb(conn_M04_AXI_WSTRB),
        .s_axi_wvalid(conn_M04_AXI_WVALID));
  MCU_axi_uartlite_0_0 uart
       (.interrupt(uart_interrupt),
        .rx(axi_uartlite_0_UART_RxD),
        .s_axi_aclk(mbcore_Clk),
        .s_axi_araddr(interconnect_M01_AXI_ARADDR),
        .s_axi_aresetn(peripheral_aresetn),
        .s_axi_arready(interconnect_M01_AXI_ARREADY),
        .s_axi_arvalid(interconnect_M01_AXI_ARVALID),
        .s_axi_awaddr(interconnect_M01_AXI_AWADDR),
        .s_axi_awready(interconnect_M01_AXI_AWREADY),
        .s_axi_awvalid(interconnect_M01_AXI_AWVALID),
        .s_axi_bready(interconnect_M01_AXI_BREADY),
        .s_axi_bresp(interconnect_M01_AXI_BRESP),
        .s_axi_bvalid(interconnect_M01_AXI_BVALID),
        .s_axi_rdata(interconnect_M01_AXI_RDATA),
        .s_axi_rready(interconnect_M01_AXI_RREADY),
        .s_axi_rresp(interconnect_M01_AXI_RRESP),
        .s_axi_rvalid(interconnect_M01_AXI_RVALID),
        .s_axi_wdata(interconnect_M01_AXI_WDATA),
        .s_axi_wready(interconnect_M01_AXI_WREADY),
        .s_axi_wstrb(interconnect_M01_AXI_WSTRB),
        .s_axi_wvalid(interconnect_M01_AXI_WVALID),
        .tx(axi_uartlite_0_UART_TxD));
endmodule

module MCU_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [8:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [8:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [3:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [3:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire conn_ACLK_net;
  wire conn_ARESETN_net;
  wire [31:0]conn_to_s00_couplers_ARADDR;
  wire [2:0]conn_to_s00_couplers_ARPROT;
  wire [0:0]conn_to_s00_couplers_ARREADY;
  wire [0:0]conn_to_s00_couplers_ARVALID;
  wire [31:0]conn_to_s00_couplers_AWADDR;
  wire [2:0]conn_to_s00_couplers_AWPROT;
  wire [0:0]conn_to_s00_couplers_AWREADY;
  wire [0:0]conn_to_s00_couplers_AWVALID;
  wire [0:0]conn_to_s00_couplers_BREADY;
  wire [1:0]conn_to_s00_couplers_BRESP;
  wire [0:0]conn_to_s00_couplers_BVALID;
  wire [31:0]conn_to_s00_couplers_RDATA;
  wire [0:0]conn_to_s00_couplers_RREADY;
  wire [1:0]conn_to_s00_couplers_RRESP;
  wire [0:0]conn_to_s00_couplers_RVALID;
  wire [31:0]conn_to_s00_couplers_WDATA;
  wire [0:0]conn_to_s00_couplers_WREADY;
  wire [3:0]conn_to_s00_couplers_WSTRB;
  wire [0:0]conn_to_s00_couplers_WVALID;
  wire [8:0]m00_couplers_to_conn_ARADDR;
  wire m00_couplers_to_conn_ARREADY;
  wire m00_couplers_to_conn_ARVALID;
  wire [8:0]m00_couplers_to_conn_AWADDR;
  wire m00_couplers_to_conn_AWREADY;
  wire m00_couplers_to_conn_AWVALID;
  wire m00_couplers_to_conn_BREADY;
  wire [1:0]m00_couplers_to_conn_BRESP;
  wire m00_couplers_to_conn_BVALID;
  wire [31:0]m00_couplers_to_conn_RDATA;
  wire m00_couplers_to_conn_RREADY;
  wire [1:0]m00_couplers_to_conn_RRESP;
  wire m00_couplers_to_conn_RVALID;
  wire [31:0]m00_couplers_to_conn_WDATA;
  wire m00_couplers_to_conn_WREADY;
  wire [3:0]m00_couplers_to_conn_WSTRB;
  wire m00_couplers_to_conn_WVALID;
  wire [3:0]m01_couplers_to_conn_ARADDR;
  wire m01_couplers_to_conn_ARREADY;
  wire m01_couplers_to_conn_ARVALID;
  wire [3:0]m01_couplers_to_conn_AWADDR;
  wire m01_couplers_to_conn_AWREADY;
  wire m01_couplers_to_conn_AWVALID;
  wire m01_couplers_to_conn_BREADY;
  wire [1:0]m01_couplers_to_conn_BRESP;
  wire m01_couplers_to_conn_BVALID;
  wire [31:0]m01_couplers_to_conn_RDATA;
  wire m01_couplers_to_conn_RREADY;
  wire [1:0]m01_couplers_to_conn_RRESP;
  wire m01_couplers_to_conn_RVALID;
  wire [31:0]m01_couplers_to_conn_WDATA;
  wire m01_couplers_to_conn_WREADY;
  wire [3:0]m01_couplers_to_conn_WSTRB;
  wire m01_couplers_to_conn_WVALID;
  wire [31:0]m02_couplers_to_conn_ARADDR;
  wire m02_couplers_to_conn_ARREADY;
  wire m02_couplers_to_conn_ARVALID;
  wire [31:0]m02_couplers_to_conn_AWADDR;
  wire m02_couplers_to_conn_AWREADY;
  wire m02_couplers_to_conn_AWVALID;
  wire m02_couplers_to_conn_BREADY;
  wire [1:0]m02_couplers_to_conn_BRESP;
  wire m02_couplers_to_conn_BVALID;
  wire [31:0]m02_couplers_to_conn_RDATA;
  wire m02_couplers_to_conn_RREADY;
  wire [1:0]m02_couplers_to_conn_RRESP;
  wire m02_couplers_to_conn_RVALID;
  wire [31:0]m02_couplers_to_conn_WDATA;
  wire m02_couplers_to_conn_WREADY;
  wire [3:0]m02_couplers_to_conn_WSTRB;
  wire m02_couplers_to_conn_WVALID;
  wire [31:0]m03_couplers_to_conn_ARADDR;
  wire m03_couplers_to_conn_ARREADY;
  wire m03_couplers_to_conn_ARVALID;
  wire [31:0]m03_couplers_to_conn_AWADDR;
  wire m03_couplers_to_conn_AWREADY;
  wire m03_couplers_to_conn_AWVALID;
  wire m03_couplers_to_conn_BREADY;
  wire [1:0]m03_couplers_to_conn_BRESP;
  wire m03_couplers_to_conn_BVALID;
  wire [31:0]m03_couplers_to_conn_RDATA;
  wire m03_couplers_to_conn_RREADY;
  wire [1:0]m03_couplers_to_conn_RRESP;
  wire m03_couplers_to_conn_RVALID;
  wire [31:0]m03_couplers_to_conn_WDATA;
  wire m03_couplers_to_conn_WREADY;
  wire [3:0]m03_couplers_to_conn_WSTRB;
  wire m03_couplers_to_conn_WVALID;
  wire [31:0]m04_couplers_to_conn_ARADDR;
  wire m04_couplers_to_conn_ARREADY;
  wire m04_couplers_to_conn_ARVALID;
  wire [31:0]m04_couplers_to_conn_AWADDR;
  wire m04_couplers_to_conn_AWREADY;
  wire m04_couplers_to_conn_AWVALID;
  wire m04_couplers_to_conn_BREADY;
  wire [1:0]m04_couplers_to_conn_BRESP;
  wire m04_couplers_to_conn_BVALID;
  wire [31:0]m04_couplers_to_conn_RDATA;
  wire m04_couplers_to_conn_RREADY;
  wire [1:0]m04_couplers_to_conn_RRESP;
  wire m04_couplers_to_conn_RVALID;
  wire [31:0]m04_couplers_to_conn_WDATA;
  wire m04_couplers_to_conn_WREADY;
  wire [3:0]m04_couplers_to_conn_WSTRB;
  wire m04_couplers_to_conn_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [0:0]s00_couplers_to_xbar_AWVALID;
  wire [0:0]s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;

  assign M00_AXI_araddr[8:0] = m00_couplers_to_conn_ARADDR;
  assign M00_AXI_arvalid = m00_couplers_to_conn_ARVALID;
  assign M00_AXI_awaddr[8:0] = m00_couplers_to_conn_AWADDR;
  assign M00_AXI_awvalid = m00_couplers_to_conn_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_conn_BREADY;
  assign M00_AXI_rready = m00_couplers_to_conn_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_conn_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_conn_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_conn_WVALID;
  assign M01_AXI_araddr[3:0] = m01_couplers_to_conn_ARADDR;
  assign M01_AXI_arvalid = m01_couplers_to_conn_ARVALID;
  assign M01_AXI_awaddr[3:0] = m01_couplers_to_conn_AWADDR;
  assign M01_AXI_awvalid = m01_couplers_to_conn_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_conn_BREADY;
  assign M01_AXI_rready = m01_couplers_to_conn_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_conn_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_conn_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_conn_WVALID;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_conn_ARADDR;
  assign M02_AXI_arvalid = m02_couplers_to_conn_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_conn_AWADDR;
  assign M02_AXI_awvalid = m02_couplers_to_conn_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_conn_BREADY;
  assign M02_AXI_rready = m02_couplers_to_conn_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_conn_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_conn_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_conn_WVALID;
  assign M03_AXI_araddr[31:0] = m03_couplers_to_conn_ARADDR;
  assign M03_AXI_arvalid = m03_couplers_to_conn_ARVALID;
  assign M03_AXI_awaddr[31:0] = m03_couplers_to_conn_AWADDR;
  assign M03_AXI_awvalid = m03_couplers_to_conn_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_conn_BREADY;
  assign M03_AXI_rready = m03_couplers_to_conn_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_conn_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_conn_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_conn_WVALID;
  assign M04_AXI_araddr[31:0] = m04_couplers_to_conn_ARADDR;
  assign M04_AXI_arvalid = m04_couplers_to_conn_ARVALID;
  assign M04_AXI_awaddr[31:0] = m04_couplers_to_conn_AWADDR;
  assign M04_AXI_awvalid = m04_couplers_to_conn_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_conn_BREADY;
  assign M04_AXI_rready = m04_couplers_to_conn_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_conn_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_conn_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_conn_WVALID;
  assign S00_AXI_arready[0] = conn_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = conn_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = conn_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = conn_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = conn_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = conn_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = conn_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = conn_to_s00_couplers_WREADY;
  assign conn_ACLK_net = ACLK;
  assign conn_ARESETN_net = ARESETN;
  assign conn_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign conn_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign conn_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign conn_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign conn_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign conn_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign conn_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign conn_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign conn_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign conn_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign conn_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  assign m00_couplers_to_conn_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_conn_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_conn_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_conn_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_conn_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_conn_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_conn_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_conn_WREADY = M00_AXI_wready;
  assign m01_couplers_to_conn_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_conn_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_conn_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_conn_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_conn_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_conn_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_conn_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_conn_WREADY = M01_AXI_wready;
  assign m02_couplers_to_conn_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_conn_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_conn_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_conn_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_conn_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_conn_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_conn_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_conn_WREADY = M02_AXI_wready;
  assign m03_couplers_to_conn_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_conn_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_conn_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_conn_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_conn_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_conn_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_conn_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_conn_WREADY = M03_AXI_wready;
  assign m04_couplers_to_conn_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_conn_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_conn_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_conn_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_conn_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_conn_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_conn_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_conn_WREADY = M04_AXI_wready;
  m00_couplers_imp_14S6N82 m00_couplers
       (.M_ACLK(conn_ACLK_net),
        .M_ARESETN(conn_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_conn_ARADDR),
        .M_AXI_arready(m00_couplers_to_conn_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_conn_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_conn_AWADDR),
        .M_AXI_awready(m00_couplers_to_conn_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_conn_AWVALID),
        .M_AXI_bready(m00_couplers_to_conn_BREADY),
        .M_AXI_bresp(m00_couplers_to_conn_BRESP),
        .M_AXI_bvalid(m00_couplers_to_conn_BVALID),
        .M_AXI_rdata(m00_couplers_to_conn_RDATA),
        .M_AXI_rready(m00_couplers_to_conn_RREADY),
        .M_AXI_rresp(m00_couplers_to_conn_RRESP),
        .M_AXI_rvalid(m00_couplers_to_conn_RVALID),
        .M_AXI_wdata(m00_couplers_to_conn_WDATA),
        .M_AXI_wready(m00_couplers_to_conn_WREADY),
        .M_AXI_wstrb(m00_couplers_to_conn_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_conn_WVALID),
        .S_ACLK(conn_ACLK_net),
        .S_ARESETN(conn_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_M1DAC7 m01_couplers
       (.M_ACLK(conn_ACLK_net),
        .M_ARESETN(conn_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_conn_ARADDR),
        .M_AXI_arready(m01_couplers_to_conn_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_conn_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_conn_AWADDR),
        .M_AXI_awready(m01_couplers_to_conn_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_conn_AWVALID),
        .M_AXI_bready(m01_couplers_to_conn_BREADY),
        .M_AXI_bresp(m01_couplers_to_conn_BRESP),
        .M_AXI_bvalid(m01_couplers_to_conn_BVALID),
        .M_AXI_rdata(m01_couplers_to_conn_RDATA),
        .M_AXI_rready(m01_couplers_to_conn_RREADY),
        .M_AXI_rresp(m01_couplers_to_conn_RRESP),
        .M_AXI_rvalid(m01_couplers_to_conn_RVALID),
        .M_AXI_wdata(m01_couplers_to_conn_WDATA),
        .M_AXI_wready(m01_couplers_to_conn_WREADY),
        .M_AXI_wstrb(m01_couplers_to_conn_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_conn_WVALID),
        .S_ACLK(conn_ACLK_net),
        .S_ARESETN(conn_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1VBSOK9 m02_couplers
       (.M_ACLK(conn_ACLK_net),
        .M_ARESETN(conn_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_conn_ARADDR),
        .M_AXI_arready(m02_couplers_to_conn_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_conn_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_conn_AWADDR),
        .M_AXI_awready(m02_couplers_to_conn_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_conn_AWVALID),
        .M_AXI_bready(m02_couplers_to_conn_BREADY),
        .M_AXI_bresp(m02_couplers_to_conn_BRESP),
        .M_AXI_bvalid(m02_couplers_to_conn_BVALID),
        .M_AXI_rdata(m02_couplers_to_conn_RDATA),
        .M_AXI_rready(m02_couplers_to_conn_RREADY),
        .M_AXI_rresp(m02_couplers_to_conn_RRESP),
        .M_AXI_rvalid(m02_couplers_to_conn_RVALID),
        .M_AXI_wdata(m02_couplers_to_conn_WDATA),
        .M_AXI_wready(m02_couplers_to_conn_WREADY),
        .M_AXI_wstrb(m02_couplers_to_conn_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_conn_WVALID),
        .S_ACLK(conn_ACLK_net),
        .S_ARESETN(conn_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_D3ELLO m03_couplers
       (.M_ACLK(conn_ACLK_net),
        .M_ARESETN(conn_ARESETN_net),
        .M_AXI_araddr(m03_couplers_to_conn_ARADDR),
        .M_AXI_arready(m03_couplers_to_conn_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_conn_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_conn_AWADDR),
        .M_AXI_awready(m03_couplers_to_conn_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_conn_AWVALID),
        .M_AXI_bready(m03_couplers_to_conn_BREADY),
        .M_AXI_bresp(m03_couplers_to_conn_BRESP),
        .M_AXI_bvalid(m03_couplers_to_conn_BVALID),
        .M_AXI_rdata(m03_couplers_to_conn_RDATA),
        .M_AXI_rready(m03_couplers_to_conn_RREADY),
        .M_AXI_rresp(m03_couplers_to_conn_RRESP),
        .M_AXI_rvalid(m03_couplers_to_conn_RVALID),
        .M_AXI_wdata(m03_couplers_to_conn_WDATA),
        .M_AXI_wready(m03_couplers_to_conn_WREADY),
        .M_AXI_wstrb(m03_couplers_to_conn_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_conn_WVALID),
        .S_ACLK(conn_ACLK_net),
        .S_ARESETN(conn_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_MTO9Z8 m04_couplers
       (.M_ACLK(conn_ACLK_net),
        .M_ARESETN(conn_ARESETN_net),
        .M_AXI_araddr(m04_couplers_to_conn_ARADDR),
        .M_AXI_arready(m04_couplers_to_conn_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_conn_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_conn_AWADDR),
        .M_AXI_awready(m04_couplers_to_conn_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_conn_AWVALID),
        .M_AXI_bready(m04_couplers_to_conn_BREADY),
        .M_AXI_bresp(m04_couplers_to_conn_BRESP),
        .M_AXI_bvalid(m04_couplers_to_conn_BVALID),
        .M_AXI_rdata(m04_couplers_to_conn_RDATA),
        .M_AXI_rready(m04_couplers_to_conn_RREADY),
        .M_AXI_rresp(m04_couplers_to_conn_RRESP),
        .M_AXI_rvalid(m04_couplers_to_conn_RVALID),
        .M_AXI_wdata(m04_couplers_to_conn_WDATA),
        .M_AXI_wready(m04_couplers_to_conn_WREADY),
        .M_AXI_wstrb(m04_couplers_to_conn_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_conn_WVALID),
        .S_ACLK(conn_ACLK_net),
        .S_ARESETN(conn_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  s00_couplers_imp_GMHCMG s00_couplers
       (.M_ACLK(conn_ACLK_net),
        .M_ARESETN(conn_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(conn_ACLK_net),
        .S_ARESETN(conn_ARESETN_net),
        .S_AXI_araddr(conn_to_s00_couplers_ARADDR),
        .S_AXI_arprot(conn_to_s00_couplers_ARPROT),
        .S_AXI_arready(conn_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(conn_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(conn_to_s00_couplers_AWADDR),
        .S_AXI_awprot(conn_to_s00_couplers_AWPROT),
        .S_AXI_awready(conn_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(conn_to_s00_couplers_AWVALID),
        .S_AXI_bready(conn_to_s00_couplers_BREADY),
        .S_AXI_bresp(conn_to_s00_couplers_BRESP),
        .S_AXI_bvalid(conn_to_s00_couplers_BVALID),
        .S_AXI_rdata(conn_to_s00_couplers_RDATA),
        .S_AXI_rready(conn_to_s00_couplers_RREADY),
        .S_AXI_rresp(conn_to_s00_couplers_RRESP),
        .S_AXI_rvalid(conn_to_s00_couplers_RVALID),
        .S_AXI_wdata(conn_to_s00_couplers_WDATA),
        .S_AXI_wready(conn_to_s00_couplers_WREADY),
        .S_AXI_wstrb(conn_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(conn_to_s00_couplers_WVALID));
  MCU_xbar_0 xbar
       (.aclk(conn_ACLK_net),
        .aresetn(conn_ARESETN_net),
        .m_axi_araddr({xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m01_couplers_ARPROT,xbar_to_m00_couplers_ARPROT}),
        .m_axi_arready({xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m01_couplers_AWPROT,xbar_to_m00_couplers_AWPROT}),
        .m_axi_awready({xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module localmem_imp_1K21ZZS
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    SYS_Rst);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input SYS_Rst;

  wire SYS_Rst_1;
  wire microblaze_0_Clk;
  wire [0:31]microblaze_0_dlmb_ABUS;
  wire microblaze_0_dlmb_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_BE;
  wire microblaze_0_dlmb_CE;
  wire [0:31]microblaze_0_dlmb_READDBUS;
  wire microblaze_0_dlmb_READSTROBE;
  wire microblaze_0_dlmb_READY;
  wire microblaze_0_dlmb_UE;
  wire microblaze_0_dlmb_WAIT;
  wire [0:31]microblaze_0_dlmb_WRITEDBUS;
  wire microblaze_0_dlmb_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_bus_ABUS;
  wire microblaze_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_bus_BE;
  wire microblaze_0_dlmb_bus_CE;
  wire [0:31]microblaze_0_dlmb_bus_READDBUS;
  wire microblaze_0_dlmb_bus_READSTROBE;
  wire microblaze_0_dlmb_bus_READY;
  wire microblaze_0_dlmb_bus_UE;
  wire microblaze_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_0_dlmb_bus_WRITEDBUS;
  wire microblaze_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_cntlr_ADDR;
  wire microblaze_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_0_dlmb_cntlr_DOUT;
  wire microblaze_0_dlmb_cntlr_EN;
  wire microblaze_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_0_ilmb_ABUS;
  wire microblaze_0_ilmb_ADDRSTROBE;
  wire microblaze_0_ilmb_CE;
  wire [0:31]microblaze_0_ilmb_READDBUS;
  wire microblaze_0_ilmb_READSTROBE;
  wire microblaze_0_ilmb_READY;
  wire microblaze_0_ilmb_UE;
  wire microblaze_0_ilmb_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_ABUS;
  wire microblaze_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_ilmb_bus_BE;
  wire microblaze_0_ilmb_bus_CE;
  wire [0:31]microblaze_0_ilmb_bus_READDBUS;
  wire microblaze_0_ilmb_bus_READSTROBE;
  wire microblaze_0_ilmb_bus_READY;
  wire microblaze_0_ilmb_bus_UE;
  wire microblaze_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_WRITEDBUS;
  wire microblaze_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_cntlr_ADDR;
  wire microblaze_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_0_ilmb_cntlr_DOUT;
  wire microblaze_0_ilmb_cntlr_EN;
  wire microblaze_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_0_ilmb_cntlr_WE;

  assign DLMB_ce = microblaze_0_dlmb_CE;
  assign DLMB_readdbus[0:31] = microblaze_0_dlmb_READDBUS;
  assign DLMB_ready = microblaze_0_dlmb_READY;
  assign DLMB_ue = microblaze_0_dlmb_UE;
  assign DLMB_wait = microblaze_0_dlmb_WAIT;
  assign ILMB_ce = microblaze_0_ilmb_CE;
  assign ILMB_readdbus[0:31] = microblaze_0_ilmb_READDBUS;
  assign ILMB_ready = microblaze_0_ilmb_READY;
  assign ILMB_ue = microblaze_0_ilmb_UE;
  assign ILMB_wait = microblaze_0_ilmb_WAIT;
  assign SYS_Rst_1 = SYS_Rst;
  assign microblaze_0_Clk = LMB_Clk;
  assign microblaze_0_dlmb_ABUS = DLMB_abus[0:31];
  assign microblaze_0_dlmb_ADDRSTROBE = DLMB_addrstrobe;
  assign microblaze_0_dlmb_BE = DLMB_be[0:3];
  assign microblaze_0_dlmb_READSTROBE = DLMB_readstrobe;
  assign microblaze_0_dlmb_WRITEDBUS = DLMB_writedbus[0:31];
  assign microblaze_0_dlmb_WRITESTROBE = DLMB_writestrobe;
  assign microblaze_0_ilmb_ABUS = ILMB_abus[0:31];
  assign microblaze_0_ilmb_ADDRSTROBE = ILMB_addrstrobe;
  assign microblaze_0_ilmb_READSTROBE = ILMB_readstrobe;
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > MCU localmem/lmb_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  MCU_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_dlmb_cntlr_DOUT[31],microblaze_0_dlmb_cntlr_DOUT[30],microblaze_0_dlmb_cntlr_DOUT[29],microblaze_0_dlmb_cntlr_DOUT[28],microblaze_0_dlmb_cntlr_DOUT[27],microblaze_0_dlmb_cntlr_DOUT[26],microblaze_0_dlmb_cntlr_DOUT[25],microblaze_0_dlmb_cntlr_DOUT[24],microblaze_0_dlmb_cntlr_DOUT[23],microblaze_0_dlmb_cntlr_DOUT[22],microblaze_0_dlmb_cntlr_DOUT[21],microblaze_0_dlmb_cntlr_DOUT[20],microblaze_0_dlmb_cntlr_DOUT[19],microblaze_0_dlmb_cntlr_DOUT[18],microblaze_0_dlmb_cntlr_DOUT[17],microblaze_0_dlmb_cntlr_DOUT[16],microblaze_0_dlmb_cntlr_DOUT[15],microblaze_0_dlmb_cntlr_DOUT[14],microblaze_0_dlmb_cntlr_DOUT[13],microblaze_0_dlmb_cntlr_DOUT[12],microblaze_0_dlmb_cntlr_DOUT[11],microblaze_0_dlmb_cntlr_DOUT[10],microblaze_0_dlmb_cntlr_DOUT[9],microblaze_0_dlmb_cntlr_DOUT[8],microblaze_0_dlmb_cntlr_DOUT[7],microblaze_0_dlmb_cntlr_DOUT[6],microblaze_0_dlmb_cntlr_DOUT[5],microblaze_0_dlmb_cntlr_DOUT[4],microblaze_0_dlmb_cntlr_DOUT[3],microblaze_0_dlmb_cntlr_DOUT[2],microblaze_0_dlmb_cntlr_DOUT[1],microblaze_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst_1),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  MCU_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_CE(microblaze_0_dlmb_CE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadDBus(microblaze_0_dlmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_dlmb_READY),
        .LMB_UE(microblaze_0_dlmb_UE),
        .LMB_Wait(microblaze_0_dlmb_WAIT),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_dlmb_ABUS),
        .M_AddrStrobe(microblaze_0_dlmb_ADDRSTROBE),
        .M_BE(microblaze_0_dlmb_BE),
        .M_DBus(microblaze_0_dlmb_WRITEDBUS),
        .M_ReadStrobe(microblaze_0_dlmb_READSTROBE),
        .M_WriteStrobe(microblaze_0_dlmb_WRITESTROBE),
        .SYS_Rst(SYS_Rst_1),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  MCU_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_ilmb_cntlr_DOUT[31],microblaze_0_ilmb_cntlr_DOUT[30],microblaze_0_ilmb_cntlr_DOUT[29],microblaze_0_ilmb_cntlr_DOUT[28],microblaze_0_ilmb_cntlr_DOUT[27],microblaze_0_ilmb_cntlr_DOUT[26],microblaze_0_ilmb_cntlr_DOUT[25],microblaze_0_ilmb_cntlr_DOUT[24],microblaze_0_ilmb_cntlr_DOUT[23],microblaze_0_ilmb_cntlr_DOUT[22],microblaze_0_ilmb_cntlr_DOUT[21],microblaze_0_ilmb_cntlr_DOUT[20],microblaze_0_ilmb_cntlr_DOUT[19],microblaze_0_ilmb_cntlr_DOUT[18],microblaze_0_ilmb_cntlr_DOUT[17],microblaze_0_ilmb_cntlr_DOUT[16],microblaze_0_ilmb_cntlr_DOUT[15],microblaze_0_ilmb_cntlr_DOUT[14],microblaze_0_ilmb_cntlr_DOUT[13],microblaze_0_ilmb_cntlr_DOUT[12],microblaze_0_ilmb_cntlr_DOUT[11],microblaze_0_ilmb_cntlr_DOUT[10],microblaze_0_ilmb_cntlr_DOUT[9],microblaze_0_ilmb_cntlr_DOUT[8],microblaze_0_ilmb_cntlr_DOUT[7],microblaze_0_ilmb_cntlr_DOUT[6],microblaze_0_ilmb_cntlr_DOUT[5],microblaze_0_ilmb_cntlr_DOUT[4],microblaze_0_ilmb_cntlr_DOUT[3],microblaze_0_ilmb_cntlr_DOUT[2],microblaze_0_ilmb_cntlr_DOUT[1],microblaze_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst_1),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  MCU_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_CE(microblaze_0_ilmb_CE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadDBus(microblaze_0_ilmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_ilmb_READY),
        .LMB_UE(microblaze_0_ilmb_UE),
        .LMB_Wait(microblaze_0_ilmb_WAIT),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_ilmb_ABUS),
        .M_AddrStrobe(microblaze_0_ilmb_ADDRSTROBE),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(microblaze_0_ilmb_READSTROBE),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst_1),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  MCU_lmb_bram_0 lmb_bram
       (.addra({microblaze_0_dlmb_cntlr_ADDR[0],microblaze_0_dlmb_cntlr_ADDR[1],microblaze_0_dlmb_cntlr_ADDR[2],microblaze_0_dlmb_cntlr_ADDR[3],microblaze_0_dlmb_cntlr_ADDR[4],microblaze_0_dlmb_cntlr_ADDR[5],microblaze_0_dlmb_cntlr_ADDR[6],microblaze_0_dlmb_cntlr_ADDR[7],microblaze_0_dlmb_cntlr_ADDR[8],microblaze_0_dlmb_cntlr_ADDR[9],microblaze_0_dlmb_cntlr_ADDR[10],microblaze_0_dlmb_cntlr_ADDR[11],microblaze_0_dlmb_cntlr_ADDR[12],microblaze_0_dlmb_cntlr_ADDR[13],microblaze_0_dlmb_cntlr_ADDR[14],microblaze_0_dlmb_cntlr_ADDR[15],microblaze_0_dlmb_cntlr_ADDR[16],microblaze_0_dlmb_cntlr_ADDR[17],microblaze_0_dlmb_cntlr_ADDR[18],microblaze_0_dlmb_cntlr_ADDR[19],microblaze_0_dlmb_cntlr_ADDR[20],microblaze_0_dlmb_cntlr_ADDR[21],microblaze_0_dlmb_cntlr_ADDR[22],microblaze_0_dlmb_cntlr_ADDR[23],microblaze_0_dlmb_cntlr_ADDR[24],microblaze_0_dlmb_cntlr_ADDR[25],microblaze_0_dlmb_cntlr_ADDR[26],microblaze_0_dlmb_cntlr_ADDR[27],microblaze_0_dlmb_cntlr_ADDR[28],microblaze_0_dlmb_cntlr_ADDR[29],microblaze_0_dlmb_cntlr_ADDR[30],microblaze_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_0_ilmb_cntlr_ADDR[0],microblaze_0_ilmb_cntlr_ADDR[1],microblaze_0_ilmb_cntlr_ADDR[2],microblaze_0_ilmb_cntlr_ADDR[3],microblaze_0_ilmb_cntlr_ADDR[4],microblaze_0_ilmb_cntlr_ADDR[5],microblaze_0_ilmb_cntlr_ADDR[6],microblaze_0_ilmb_cntlr_ADDR[7],microblaze_0_ilmb_cntlr_ADDR[8],microblaze_0_ilmb_cntlr_ADDR[9],microblaze_0_ilmb_cntlr_ADDR[10],microblaze_0_ilmb_cntlr_ADDR[11],microblaze_0_ilmb_cntlr_ADDR[12],microblaze_0_ilmb_cntlr_ADDR[13],microblaze_0_ilmb_cntlr_ADDR[14],microblaze_0_ilmb_cntlr_ADDR[15],microblaze_0_ilmb_cntlr_ADDR[16],microblaze_0_ilmb_cntlr_ADDR[17],microblaze_0_ilmb_cntlr_ADDR[18],microblaze_0_ilmb_cntlr_ADDR[19],microblaze_0_ilmb_cntlr_ADDR[20],microblaze_0_ilmb_cntlr_ADDR[21],microblaze_0_ilmb_cntlr_ADDR[22],microblaze_0_ilmb_cntlr_ADDR[23],microblaze_0_ilmb_cntlr_ADDR[24],microblaze_0_ilmb_cntlr_ADDR[25],microblaze_0_ilmb_cntlr_ADDR[26],microblaze_0_ilmb_cntlr_ADDR[27],microblaze_0_ilmb_cntlr_ADDR[28],microblaze_0_ilmb_cntlr_ADDR[29],microblaze_0_ilmb_cntlr_ADDR[30],microblaze_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_0_dlmb_cntlr_CLK),
        .clkb(microblaze_0_ilmb_cntlr_CLK),
        .dina({microblaze_0_dlmb_cntlr_DIN[0],microblaze_0_dlmb_cntlr_DIN[1],microblaze_0_dlmb_cntlr_DIN[2],microblaze_0_dlmb_cntlr_DIN[3],microblaze_0_dlmb_cntlr_DIN[4],microblaze_0_dlmb_cntlr_DIN[5],microblaze_0_dlmb_cntlr_DIN[6],microblaze_0_dlmb_cntlr_DIN[7],microblaze_0_dlmb_cntlr_DIN[8],microblaze_0_dlmb_cntlr_DIN[9],microblaze_0_dlmb_cntlr_DIN[10],microblaze_0_dlmb_cntlr_DIN[11],microblaze_0_dlmb_cntlr_DIN[12],microblaze_0_dlmb_cntlr_DIN[13],microblaze_0_dlmb_cntlr_DIN[14],microblaze_0_dlmb_cntlr_DIN[15],microblaze_0_dlmb_cntlr_DIN[16],microblaze_0_dlmb_cntlr_DIN[17],microblaze_0_dlmb_cntlr_DIN[18],microblaze_0_dlmb_cntlr_DIN[19],microblaze_0_dlmb_cntlr_DIN[20],microblaze_0_dlmb_cntlr_DIN[21],microblaze_0_dlmb_cntlr_DIN[22],microblaze_0_dlmb_cntlr_DIN[23],microblaze_0_dlmb_cntlr_DIN[24],microblaze_0_dlmb_cntlr_DIN[25],microblaze_0_dlmb_cntlr_DIN[26],microblaze_0_dlmb_cntlr_DIN[27],microblaze_0_dlmb_cntlr_DIN[28],microblaze_0_dlmb_cntlr_DIN[29],microblaze_0_dlmb_cntlr_DIN[30],microblaze_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_0_ilmb_cntlr_DIN[0],microblaze_0_ilmb_cntlr_DIN[1],microblaze_0_ilmb_cntlr_DIN[2],microblaze_0_ilmb_cntlr_DIN[3],microblaze_0_ilmb_cntlr_DIN[4],microblaze_0_ilmb_cntlr_DIN[5],microblaze_0_ilmb_cntlr_DIN[6],microblaze_0_ilmb_cntlr_DIN[7],microblaze_0_ilmb_cntlr_DIN[8],microblaze_0_ilmb_cntlr_DIN[9],microblaze_0_ilmb_cntlr_DIN[10],microblaze_0_ilmb_cntlr_DIN[11],microblaze_0_ilmb_cntlr_DIN[12],microblaze_0_ilmb_cntlr_DIN[13],microblaze_0_ilmb_cntlr_DIN[14],microblaze_0_ilmb_cntlr_DIN[15],microblaze_0_ilmb_cntlr_DIN[16],microblaze_0_ilmb_cntlr_DIN[17],microblaze_0_ilmb_cntlr_DIN[18],microblaze_0_ilmb_cntlr_DIN[19],microblaze_0_ilmb_cntlr_DIN[20],microblaze_0_ilmb_cntlr_DIN[21],microblaze_0_ilmb_cntlr_DIN[22],microblaze_0_ilmb_cntlr_DIN[23],microblaze_0_ilmb_cntlr_DIN[24],microblaze_0_ilmb_cntlr_DIN[25],microblaze_0_ilmb_cntlr_DIN[26],microblaze_0_ilmb_cntlr_DIN[27],microblaze_0_ilmb_cntlr_DIN[28],microblaze_0_ilmb_cntlr_DIN[29],microblaze_0_ilmb_cntlr_DIN[30],microblaze_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_0_ilmb_cntlr_DOUT),
        .ena(microblaze_0_dlmb_cntlr_EN),
        .enb(microblaze_0_ilmb_cntlr_EN),
        .rsta(microblaze_0_dlmb_cntlr_RST),
        .rstb(microblaze_0_ilmb_cntlr_RST),
        .wea({microblaze_0_dlmb_cntlr_WE[0],microblaze_0_dlmb_cntlr_WE[1],microblaze_0_dlmb_cntlr_WE[2],microblaze_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_0_ilmb_cntlr_WE[0],microblaze_0_ilmb_cntlr_WE[1],microblaze_0_ilmb_cntlr_WE[2],microblaze_0_ilmb_cntlr_WE[3]}));
endmodule

module m00_couplers_imp_14S6N82
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [8:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [8:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m00_couplers_to_m00_data_fifo_ARADDR;
  wire [2:0]m00_couplers_to_m00_data_fifo_ARPROT;
  wire m00_couplers_to_m00_data_fifo_ARREADY;
  wire m00_couplers_to_m00_data_fifo_ARVALID;
  wire [31:0]m00_couplers_to_m00_data_fifo_AWADDR;
  wire [2:0]m00_couplers_to_m00_data_fifo_AWPROT;
  wire m00_couplers_to_m00_data_fifo_AWREADY;
  wire m00_couplers_to_m00_data_fifo_AWVALID;
  wire m00_couplers_to_m00_data_fifo_BREADY;
  wire [1:0]m00_couplers_to_m00_data_fifo_BRESP;
  wire m00_couplers_to_m00_data_fifo_BVALID;
  wire [31:0]m00_couplers_to_m00_data_fifo_RDATA;
  wire m00_couplers_to_m00_data_fifo_RREADY;
  wire [1:0]m00_couplers_to_m00_data_fifo_RRESP;
  wire m00_couplers_to_m00_data_fifo_RVALID;
  wire [31:0]m00_couplers_to_m00_data_fifo_WDATA;
  wire m00_couplers_to_m00_data_fifo_WREADY;
  wire [3:0]m00_couplers_to_m00_data_fifo_WSTRB;
  wire m00_couplers_to_m00_data_fifo_WVALID;
  wire [8:0]m00_data_fifo_to_m00_couplers_ARADDR;
  wire m00_data_fifo_to_m00_couplers_ARREADY;
  wire m00_data_fifo_to_m00_couplers_ARVALID;
  wire [8:0]m00_data_fifo_to_m00_couplers_AWADDR;
  wire m00_data_fifo_to_m00_couplers_AWREADY;
  wire m00_data_fifo_to_m00_couplers_AWVALID;
  wire m00_data_fifo_to_m00_couplers_BREADY;
  wire [1:0]m00_data_fifo_to_m00_couplers_BRESP;
  wire m00_data_fifo_to_m00_couplers_BVALID;
  wire [31:0]m00_data_fifo_to_m00_couplers_RDATA;
  wire m00_data_fifo_to_m00_couplers_RREADY;
  wire [1:0]m00_data_fifo_to_m00_couplers_RRESP;
  wire m00_data_fifo_to_m00_couplers_RVALID;
  wire [31:0]m00_data_fifo_to_m00_couplers_WDATA;
  wire m00_data_fifo_to_m00_couplers_WREADY;
  wire [3:0]m00_data_fifo_to_m00_couplers_WSTRB;
  wire m00_data_fifo_to_m00_couplers_WVALID;

  assign M_AXI_araddr[8:0] = m00_data_fifo_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid = m00_data_fifo_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[8:0] = m00_data_fifo_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid = m00_data_fifo_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_data_fifo_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_data_fifo_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_data_fifo_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_data_fifo_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_data_fifo_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_m00_data_fifo_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_data_fifo_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_data_fifo_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_data_fifo_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_data_fifo_WREADY;
  assign m00_couplers_to_m00_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_m00_data_fifo_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_m00_data_fifo_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_data_fifo_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_data_fifo_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_data_fifo_WVALID = S_AXI_wvalid;
  assign m00_data_fifo_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_data_fifo_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_data_fifo_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_data_fifo_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_data_fifo_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_data_fifo_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_data_fifo_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_data_fifo_to_m00_couplers_WREADY = M_AXI_wready;
  MCU_m00_data_fifo_0 m00_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m00_data_fifo_to_m00_couplers_ARADDR),
        .m_axi_arready(m00_data_fifo_to_m00_couplers_ARREADY),
        .m_axi_arvalid(m00_data_fifo_to_m00_couplers_ARVALID),
        .m_axi_awaddr(m00_data_fifo_to_m00_couplers_AWADDR),
        .m_axi_awready(m00_data_fifo_to_m00_couplers_AWREADY),
        .m_axi_awvalid(m00_data_fifo_to_m00_couplers_AWVALID),
        .m_axi_bready(m00_data_fifo_to_m00_couplers_BREADY),
        .m_axi_bresp(m00_data_fifo_to_m00_couplers_BRESP),
        .m_axi_bvalid(m00_data_fifo_to_m00_couplers_BVALID),
        .m_axi_rdata(m00_data_fifo_to_m00_couplers_RDATA),
        .m_axi_rready(m00_data_fifo_to_m00_couplers_RREADY),
        .m_axi_rresp(m00_data_fifo_to_m00_couplers_RRESP),
        .m_axi_rvalid(m00_data_fifo_to_m00_couplers_RVALID),
        .m_axi_wdata(m00_data_fifo_to_m00_couplers_WDATA),
        .m_axi_wready(m00_data_fifo_to_m00_couplers_WREADY),
        .m_axi_wstrb(m00_data_fifo_to_m00_couplers_WSTRB),
        .m_axi_wvalid(m00_data_fifo_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_m00_data_fifo_ARADDR[8:0]),
        .s_axi_arprot(m00_couplers_to_m00_data_fifo_ARPROT),
        .s_axi_arready(m00_couplers_to_m00_data_fifo_ARREADY),
        .s_axi_arvalid(m00_couplers_to_m00_data_fifo_ARVALID),
        .s_axi_awaddr(m00_couplers_to_m00_data_fifo_AWADDR[8:0]),
        .s_axi_awprot(m00_couplers_to_m00_data_fifo_AWPROT),
        .s_axi_awready(m00_couplers_to_m00_data_fifo_AWREADY),
        .s_axi_awvalid(m00_couplers_to_m00_data_fifo_AWVALID),
        .s_axi_bready(m00_couplers_to_m00_data_fifo_BREADY),
        .s_axi_bresp(m00_couplers_to_m00_data_fifo_BRESP),
        .s_axi_bvalid(m00_couplers_to_m00_data_fifo_BVALID),
        .s_axi_rdata(m00_couplers_to_m00_data_fifo_RDATA),
        .s_axi_rready(m00_couplers_to_m00_data_fifo_RREADY),
        .s_axi_rresp(m00_couplers_to_m00_data_fifo_RRESP),
        .s_axi_rvalid(m00_couplers_to_m00_data_fifo_RVALID),
        .s_axi_wdata(m00_couplers_to_m00_data_fifo_WDATA),
        .s_axi_wready(m00_couplers_to_m00_data_fifo_WREADY),
        .s_axi_wstrb(m00_couplers_to_m00_data_fifo_WSTRB),
        .s_axi_wvalid(m00_couplers_to_m00_data_fifo_WVALID));
endmodule

module m01_couplers_imp_M1DAC7
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [3:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [3:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m01_couplers_to_m01_data_fifo_ARADDR;
  wire [2:0]m01_couplers_to_m01_data_fifo_ARPROT;
  wire m01_couplers_to_m01_data_fifo_ARREADY;
  wire m01_couplers_to_m01_data_fifo_ARVALID;
  wire [31:0]m01_couplers_to_m01_data_fifo_AWADDR;
  wire [2:0]m01_couplers_to_m01_data_fifo_AWPROT;
  wire m01_couplers_to_m01_data_fifo_AWREADY;
  wire m01_couplers_to_m01_data_fifo_AWVALID;
  wire m01_couplers_to_m01_data_fifo_BREADY;
  wire [1:0]m01_couplers_to_m01_data_fifo_BRESP;
  wire m01_couplers_to_m01_data_fifo_BVALID;
  wire [31:0]m01_couplers_to_m01_data_fifo_RDATA;
  wire m01_couplers_to_m01_data_fifo_RREADY;
  wire [1:0]m01_couplers_to_m01_data_fifo_RRESP;
  wire m01_couplers_to_m01_data_fifo_RVALID;
  wire [31:0]m01_couplers_to_m01_data_fifo_WDATA;
  wire m01_couplers_to_m01_data_fifo_WREADY;
  wire [3:0]m01_couplers_to_m01_data_fifo_WSTRB;
  wire m01_couplers_to_m01_data_fifo_WVALID;
  wire [3:0]m01_data_fifo_to_m01_couplers_ARADDR;
  wire m01_data_fifo_to_m01_couplers_ARREADY;
  wire m01_data_fifo_to_m01_couplers_ARVALID;
  wire [3:0]m01_data_fifo_to_m01_couplers_AWADDR;
  wire m01_data_fifo_to_m01_couplers_AWREADY;
  wire m01_data_fifo_to_m01_couplers_AWVALID;
  wire m01_data_fifo_to_m01_couplers_BREADY;
  wire [1:0]m01_data_fifo_to_m01_couplers_BRESP;
  wire m01_data_fifo_to_m01_couplers_BVALID;
  wire [31:0]m01_data_fifo_to_m01_couplers_RDATA;
  wire m01_data_fifo_to_m01_couplers_RREADY;
  wire [1:0]m01_data_fifo_to_m01_couplers_RRESP;
  wire m01_data_fifo_to_m01_couplers_RVALID;
  wire [31:0]m01_data_fifo_to_m01_couplers_WDATA;
  wire m01_data_fifo_to_m01_couplers_WREADY;
  wire [3:0]m01_data_fifo_to_m01_couplers_WSTRB;
  wire m01_data_fifo_to_m01_couplers_WVALID;

  assign M_AXI_araddr[3:0] = m01_data_fifo_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid = m01_data_fifo_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[3:0] = m01_data_fifo_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid = m01_data_fifo_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_data_fifo_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_data_fifo_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_data_fifo_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_data_fifo_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = m01_data_fifo_to_m01_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m01_couplers_to_m01_data_fifo_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_data_fifo_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_data_fifo_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_data_fifo_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_data_fifo_WREADY;
  assign m01_couplers_to_m01_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_m01_data_fifo_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_m01_data_fifo_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_data_fifo_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_data_fifo_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_data_fifo_WVALID = S_AXI_wvalid;
  assign m01_data_fifo_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_data_fifo_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_data_fifo_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_data_fifo_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_data_fifo_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_data_fifo_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_data_fifo_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_data_fifo_to_m01_couplers_WREADY = M_AXI_wready;
  MCU_m01_data_fifo_0 m01_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m01_data_fifo_to_m01_couplers_ARADDR),
        .m_axi_arready(m01_data_fifo_to_m01_couplers_ARREADY),
        .m_axi_arvalid(m01_data_fifo_to_m01_couplers_ARVALID),
        .m_axi_awaddr(m01_data_fifo_to_m01_couplers_AWADDR),
        .m_axi_awready(m01_data_fifo_to_m01_couplers_AWREADY),
        .m_axi_awvalid(m01_data_fifo_to_m01_couplers_AWVALID),
        .m_axi_bready(m01_data_fifo_to_m01_couplers_BREADY),
        .m_axi_bresp(m01_data_fifo_to_m01_couplers_BRESP),
        .m_axi_bvalid(m01_data_fifo_to_m01_couplers_BVALID),
        .m_axi_rdata(m01_data_fifo_to_m01_couplers_RDATA),
        .m_axi_rready(m01_data_fifo_to_m01_couplers_RREADY),
        .m_axi_rresp(m01_data_fifo_to_m01_couplers_RRESP),
        .m_axi_rvalid(m01_data_fifo_to_m01_couplers_RVALID),
        .m_axi_wdata(m01_data_fifo_to_m01_couplers_WDATA),
        .m_axi_wready(m01_data_fifo_to_m01_couplers_WREADY),
        .m_axi_wstrb(m01_data_fifo_to_m01_couplers_WSTRB),
        .m_axi_wvalid(m01_data_fifo_to_m01_couplers_WVALID),
        .s_axi_araddr(m01_couplers_to_m01_data_fifo_ARADDR[3:0]),
        .s_axi_arprot(m01_couplers_to_m01_data_fifo_ARPROT),
        .s_axi_arready(m01_couplers_to_m01_data_fifo_ARREADY),
        .s_axi_arvalid(m01_couplers_to_m01_data_fifo_ARVALID),
        .s_axi_awaddr(m01_couplers_to_m01_data_fifo_AWADDR[3:0]),
        .s_axi_awprot(m01_couplers_to_m01_data_fifo_AWPROT),
        .s_axi_awready(m01_couplers_to_m01_data_fifo_AWREADY),
        .s_axi_awvalid(m01_couplers_to_m01_data_fifo_AWVALID),
        .s_axi_bready(m01_couplers_to_m01_data_fifo_BREADY),
        .s_axi_bresp(m01_couplers_to_m01_data_fifo_BRESP),
        .s_axi_bvalid(m01_couplers_to_m01_data_fifo_BVALID),
        .s_axi_rdata(m01_couplers_to_m01_data_fifo_RDATA),
        .s_axi_rready(m01_couplers_to_m01_data_fifo_RREADY),
        .s_axi_rresp(m01_couplers_to_m01_data_fifo_RRESP),
        .s_axi_rvalid(m01_couplers_to_m01_data_fifo_RVALID),
        .s_axi_wdata(m01_couplers_to_m01_data_fifo_WDATA),
        .s_axi_wready(m01_couplers_to_m01_data_fifo_WREADY),
        .s_axi_wstrb(m01_couplers_to_m01_data_fifo_WSTRB),
        .s_axi_wvalid(m01_couplers_to_m01_data_fifo_WVALID));
endmodule

module m02_couplers_imp_1VBSOK9
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire m02_couplers_to_m02_couplers_ARREADY;
  wire m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire m02_couplers_to_m02_couplers_AWREADY;
  wire m02_couplers_to_m02_couplers_AWVALID;
  wire m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid;
endmodule

module m03_couplers_imp_D3ELLO
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m03_couplers_to_m03_couplers_ARADDR;
  wire m03_couplers_to_m03_couplers_ARREADY;
  wire m03_couplers_to_m03_couplers_ARVALID;
  wire [31:0]m03_couplers_to_m03_couplers_AWADDR;
  wire m03_couplers_to_m03_couplers_AWREADY;
  wire m03_couplers_to_m03_couplers_AWVALID;
  wire m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid;
endmodule

module m04_couplers_imp_MTO9Z8
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m04_couplers_to_m04_couplers_ARADDR;
  wire m04_couplers_to_m04_couplers_ARREADY;
  wire m04_couplers_to_m04_couplers_ARVALID;
  wire [31:0]m04_couplers_to_m04_couplers_AWADDR;
  wire m04_couplers_to_m04_couplers_AWREADY;
  wire m04_couplers_to_m04_couplers_AWVALID;
  wire m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arvalid = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awvalid = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_GMHCMG
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [0:0]s00_couplers_to_s00_couplers_AWREADY;
  wire [0:0]s00_couplers_to_s00_couplers_AWVALID;
  wire [0:0]s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire [0:0]s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire [0:0]s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire [0:0]s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid[0] = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready[0] = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready[0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready[0];
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid[0];
endmodule
