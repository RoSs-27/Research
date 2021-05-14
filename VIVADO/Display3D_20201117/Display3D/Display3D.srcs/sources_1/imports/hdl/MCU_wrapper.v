//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Tue Nov 17 15:51:57 2020
//Host        : Parasha running 64-bit major release  (build 9200)
//Command     : generate_target MCU_wrapper.bd
//Design      : MCU_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MCU_wrapper
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
  input ISYSCLK;
  input ISYSRST;
  input ITIMER_CAP0;
  input ITIMER_CAP1;
  input ITIMER_FRZ;
  output [7:0]LED_tri_o;
  output OCLK10;
  output OLOCKED;
  output [0:0]OPERI_RST;
  output [0:0]OPERI_XRST;
  output OTIMER_GEN0;
  output OTIMER_GEN1;
  output OTIMER_PWM;
  input [31:0]REVHW_tri_i;
  input [7:0]SW_tri_i;
  input UART_rxd;
  output UART_txd;

  wire IINTR;
  wire ISYSCLK;
  wire ISYSRST;
  wire ITIMER_CAP0;
  wire ITIMER_CAP1;
  wire ITIMER_FRZ;
  wire [7:0]LED_tri_o;
  wire OCLK10;
  wire OLOCKED;
  wire [0:0]OPERI_RST;
  wire [0:0]OPERI_XRST;
  wire OTIMER_GEN0;
  wire OTIMER_GEN1;
  wire OTIMER_PWM;
  wire [31:0]REVHW_tri_i;
  wire [7:0]SW_tri_i;
  wire UART_rxd;
  wire UART_txd;

  MCU MCU_i
       (.IINTR(IINTR),
        .ISYSCLK(ISYSCLK),
        .ISYSRST(ISYSRST),
        .ITIMER_CAP0(ITIMER_CAP0),
        .ITIMER_CAP1(ITIMER_CAP1),
        .ITIMER_FRZ(ITIMER_FRZ),
        .LED_tri_o(LED_tri_o),
        .OCLK10(OCLK10),
        .OLOCKED(OLOCKED),
        .OPERI_RST(OPERI_RST),
        .OPERI_XRST(OPERI_XRST),
        .OTIMER_GEN0(OTIMER_GEN0),
        .OTIMER_GEN1(OTIMER_GEN1),
        .OTIMER_PWM(OTIMER_PWM),
        .REVHW_tri_i(REVHW_tri_i),
        .SW_tri_i(SW_tri_i),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
