//                              -*- Mode: Verilog -*-
// Filename        : SPI_SLAVE.sv
// Description     : 
// Author          : Oikawa Minoru
// Created On      : Mon Jan 11 22:45:42 2021
// Last Modified By: Oikawa Minoru
// Last Modified On: 2021-02-03 18:41:35
// Update Count    : 0
// Status          : Unknown, Use with caution!
`include "USER_DEFINES.vh"

module SPI_SLAVE (
   input wire        IRST,
   input wire        ICLK,   //-- 100 MHz (10ns)
   //-- SPI interface.
   intf_SPI.slv      SPI_slave,
   //-- FIFO interface.
   intf_REGI.mst     REGI_master,
   output wire [7:0] OCMD,
   input wire [7:0]  IDATA
   );
   localparam [3:0] st_Idle  = 4'h1;
   localparam [3:0] st_Stby  = 4'h2;
   localparam [3:0] st_Regwr = 4'h4;
   localparam [3:0] st_Regrd = 4'h5;
   localparam [3:0] st_Error = 4'hE;
   //-- 
   wire   ISCLK = SPI_slave.ISCLK;
   wire   IXCS  = SPI_slave.IXCS;
   wire   IMOSI = SPI_slave.IMOSI;
   assign SPI_slave.OMISO = 1'b1;

   reg    r_WE, r_RE;
   assign  REGI_master.OWE = r_WE; 
   assign  REGI_master.ORE = r_RE; 
   
   reg [3:0] st, nx;
   
   /*
    * Detect rise/fall edge of ISCLK.
    */
   reg [2:0] sclk_sync;
   always_ff @ (posedge ICLK) begin
      if (IRST) sclk_sync <= 3'b0;
      else      sclk_sync <= {sclk_sync[1:0], ISCLK};
   end
   wire sclk_rise = (sclk_sync[2:1]==2'b01);
   wire sclk_fall = (sclk_sync[2:1]==2'b10);
   reg  r_sclk_fall;
   always @ (posedge ICLK) begin
      if (IRST) r_sclk_fall <= 1'b0;
      else      r_sclk_fall <= sclk_fall;
   end
   
   /*
    * 
    */
   reg [1:0] mosi_sync;
   always_ff @ (posedge ICLK) begin
      mosi_sync <= {mosi_sync[0], IMOSI};
   end
   wire mosi = mosi_sync[1];
   /*
    * 
    */
   reg [1:0] xcs_sync;
   always_ff @ (posedge ICLK) begin
      xcs_sync <= {xcs_sync[0], IXCS};
   end
   wire xcs = xcs_sync[1];
   /*
    * count received bit.
    */
   reg [2:0] bit_count;  //-- should have 3 bits width.
   always_ff @ (posedge ICLK) begin
      if (IRST) bit_count <= 3'd0;
      else if (sclk_fall) begin
         if (xcs) bit_count <= 3'd0;  // @ negated.
         else     bit_count <= bit_count + 3'd1;
      end
   end
   /*
    * count received Byte.
    */
   reg [7:0] byte_count;
   wire      s_byte_count_incr = (bit_count==3'd7);
   always_ff @ (posedge ICLK) begin
      if (IRST) byte_count <= 8'd0;
      else if (sclk_fall) begin
         if (xcs) byte_count <= 8'd0;
         else if (s_byte_count_incr) byte_count <= byte_count + 8'd1;
      end
   end

   reg [7:0] mosi_sft;
   always_ff @ (posedge ICLK) begin
      if (!xcs && sclk_fall) begin
         mosi_sft <= {mosi_sft[6:0], mosi}; //-- shift in from LSB.
      end
   end

   reg [7:0] recv_byte[0:7];
   always_ff @ (posedge ICLK) begin
      if (!xcs && sclk_fall) begin
         if (bit_count == 3'd7) begin
            recv_byte[byte_count] <= {mosi_sft[6:0], mosi};
         end
      end
   end
   assign OCMD  = recv_byte[0];
   assign REGI_master.OWADDR = recv_byte[1];
   assign REGI_master.ORADDR = recv_byte[1];
   assign REGI_master.OWDATA = recv_byte[2];
   /*
    * OWE: write enable.
    */
   always @ (posedge ICLK) begin
      if (IRST) r_WE <= 1'b0;
      else      r_WE <= (st==st_Regwr      &&  sclk_fall  &&
                        byte_count==8'd2  &&  bit_count==8'd7);
   end

   always_ff @ (posedge ICLK) begin
      if (IRST) st <= st_Idle;
      else      st <= nx;
   end
   always_comb begin
      nx = st;
      if (xcs) nx = st_Idle;
      else begin
         case (st) 
           st_Idle: nx = st_Stby;
           st_Stby:
              if (sclk_fall && byte_count==8'd1 && bit_count==8'd0) begin
                 case (recv_byte[0]) 
                   `CMD_REGWR: nx = st_Regwr;
                   `CMD_REGRD: nx = st_Regrd;
                   default:    nx = st_Error;
                 endcase // case (recv_byte[0])
              end
           st_Regwr: ;    
           st_Regrd: ; 
           st_Error: ; 
           default: nx = st_Idle;
         endcase // case (st)
      end
   end // always_comb
   
endmodule // SPI_SLAVE

