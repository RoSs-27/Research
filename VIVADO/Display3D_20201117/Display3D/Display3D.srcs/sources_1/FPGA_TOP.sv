//                              -*- Mode: Verilog -*-
// Filename        : FPGA_TOP.sv
// Description     : 
// Author          : 
// Created On      : Sat Nov 14 17:41:23 2020
// Last Modified By: 
// Last Modified On: 2020-11-17 15:55:40
// Update Count    : 0
// Status          : Unknown, Use with caution!

`include "USER_DEFINE.vh"

module FPGA_TOP (
  /*
   * GPIOs.
   */
   output wire       PIO_01,   PIO_17,   PIO_33,  //
   output wire       PIO_02,   PIO_18,   PIO_34,  //
   output wire       PIO_03,   PIO_19,   PIO_35,  // 
   output wire       PIO_04,   PIO_20,   PIO_36,  // 
   output wire       PIO_05,   PIO_21,   PIO_37,  // 
   output wire       PIO_06,   PIO_22,   PIO_38,  // 
   output wire       PIO_07,   PIO_23,   PIO_39,  // 
   output wire       PIO_08, /*PIO_24,*/ PIO_40, // PIO_24 is "VU"
   output wire       PIO_09, /*PIO_25,*/ PIO_41, // PIO_25 is "GND"
   output wire       PIO_10,   PIO_26,   PIO_42, // 
   output wire       PIO_11,   PIO_27,   PIO_43, // 
   output wire       PIO_12,   PIO_28,   PIO_44, // 
   output wire       PIO_13,   PIO_29,   PIO_45, // 
   output wire       PIO_14,   PIO_30,   PIO_46, // 
   output wire     /*PIO_15,*/ PIO_31,   PIO_47, // PIO_15 is "analog domain".
   output wire     /*PIO_16,*/ PIO_32,   PIO_48, // PIO_16 is "analog domain".
  /*
   * Pmod interface.
   */
   output wire [7:0] PMOD,
  /*
   * External SRAM.
   */
   output wire [18:0] RAM_ADDR,
   inout  wire [7:0]  RAM_DATA,
   output wire        RAM_XOE, //-- Output enable (active low)
   output wire        RAM_XWE, //-- Write enable (active low)
   output wire        RAM_XCE, //-- Chip enable (active low)
  /*
   * UART.
   */
   output wire       UART_RXD_OUT,
   input wire        UART_TXD_IN,
  /*
   * Buttons and LEDs.
   */
   input wire [1:0]  BTN, //-- Buttons.
   output wire [1:0] LED, //-- LEDs (Green).
   output wire       RGB_R, //-- Red   at RGB LED.
   output wire       RGB_G, //-- Green at RGB LED.
   output wire       RGB_B, //-- Blue  at RGB LED.
  /*
   * System clock.
   */
   input wire        ISYSCLK  //-- 12 MHz Clock Signal.
   );

   wire clk10;
   wire s_40kHz;
   wire sysrst = BTN[0];
   wire rst;
   wire xrst;
   wire locked;

//   assign LED[0] = BTN[0];
//   assign LED[1] = BTN[1];
   
   assign RAM_XCE = `HI;
   assign RAM_XWE = `HI;
   assign RAM_XOE = `HI;

   GEN40KHZ gen40kHz (
      .O40KHZ(s_40kHz),
      .O40KHZ_R(),
      .O40KHZ_F(),
      .IRST(rst),
      .ICLK(clk10));

   assign PIO_44 = sysrst;
   assign PIO_45 = locked;
   assign PIO_46 = rst;
   assign PIO_47 = clk10;
   assign PIO_48 = s_40kHz;

   wire [7:0] s_mcu_led;
   wire [7:0] s_mcu_sw;
   assign LED[1:0] = s_mcu_led[1:0];
   assign {RGB_B, RGB_G, RGB_R} = s_mcu_led[4:2];

   assign s_mcu_sw = {6'b010101, BTN[1:0]};

   wire [31:0] s_revhw = {16'hABCD, `HW_REV_MAJOR, `HW_REV_MINOR};

   wire        s_mcu_intr = BTN[1];

   MCU_wrapper mcu_wrapper (
      .ISYSCLK      (ISYSCLK),
      .ISYSRST      (sysrst),
      //-- LEDs
      .LED_tri_o    (s_mcu_led),
      .SW_tri_i     (s_mcu_sw),
      .REVHW_tri_i  (s_revhw),
      //-- Uart.
      .UART_rxd     (UART_TXD_IN),
      .UART_txd     (UART_RXD_OUT),
      //-- Interrupt
      .IINTR        (s_mcu_intr),
      //-- Timer
      .ITIMER_FRZ   (`LO),
      .ITIMER_CAP0  (`LO),
      .ITIMER_CAP1  (`LO),
      .OTIMER_GEN0  (s_timer_gen0),
      .OTIMER_GEN1  (s_timer_gen1),
      .OTIMER_PWM   (s_timer_pwm),
      //-- System.
      .OLOCKED      (locked),
      .OPERI_RST    (rst),
      .OPERI_XRST   (xrst),
      .OCLK10       (clk10));
endmodule // FPGA_TOP

