//                              -*- Mode: Verilog -*-
// Filename        : sim_FPGA_TOP.sv
// Description     : 
// Author          : 
// Created On      : Sat Nov 14 17:43:34 2020
// Last Modified By: 
// Last Modified On: 2020-11-16 22:08:04
// Update Count    : 0
// Status          : Unknown, Use with caution!
`timescale 1ns / 1ns

module sim_FPGA_TOP( );

   reg ISYSCLK;
   logic [1:0] BTN;
   
   
   wire PIO_01, PIO_09, PIO_17, /*PIO_25,*/ PIO_33, PIO_41;
   wire PIO_02, PIO_10, PIO_18, PIO_26, PIO_34, PIO_42;
   wire PIO_03, PIO_11, PIO_19, PIO_27, PIO_35, PIO_43;
   wire PIO_04, PIO_12, PIO_20, PIO_28, PIO_36, PIO_44;
   wire PIO_05, PIO_13, PIO_21, PIO_29, PIO_37, PIO_45;
   wire PIO_06, PIO_14, PIO_22, PIO_30, PIO_38, PIO_46;
   wire PIO_07, /*PIO_15,*/ PIO_23, PIO_31, PIO_39, PIO_47;
   wire PIO_08, /*PIO_16,*/ /*PIO_24,*/ PIO_32, PIO_40, PIO_48;
   

   FPGA_TOP fpga_top (
      .PIO_01,  .PIO_09,  .PIO_17,/*.PIO_25,*/ .PIO_33, .PIO_41, 
      .PIO_02,  .PIO_10,  .PIO_18,  .PIO_26,   .PIO_34, .PIO_42, 
      .PIO_03,  .PIO_11,  .PIO_19,  .PIO_27,   .PIO_35, .PIO_43, 
      .PIO_04,  .PIO_12,  .PIO_20,  .PIO_28,   .PIO_36, .PIO_44, 
      .PIO_05,  .PIO_13,  .PIO_21,  .PIO_29,   .PIO_37, .PIO_45, 
      .PIO_06,  .PIO_14,  .PIO_22,  .PIO_30,   .PIO_38, .PIO_46, 
      .PIO_07,/*.PIO_15,*/.PIO_23,  .PIO_31,   .PIO_39, .PIO_47, 
      .PIO_08,/*.PIO_16,  .PIO_24,*/.PIO_32,   .PIO_40, .PIO_48, 
      .BTN,
      .ISYSCLK
   );

   initial begin
      init_sim();
      fork
         forever begin
            #50 ISYSCLK = 1'b1;
            #50 ISYSCLK = 1'b0;
         end
      join
      
   end

   task init_sim;
      begin
         BTN = 2'b00;
      end
   endtask

   task Reset;
      begin

      end
   endtask //
endmodule // sim_FPGA_TOP

