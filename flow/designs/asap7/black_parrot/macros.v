// hard_mem_1rw_d512_w64_wrapper
// Four fakeram7_256x32 macros: 2 depth-banks (addr[8]) x 2 width-columns
// (lo=data[31:0], hi=data[63:32]).  Exact width match: 32+32 = 64.
module hard_mem_1rw_d512_w64_wrapper(clk_i, v_i, reset_i, data_i,
     addr_i, w_i, data_o);
  input clk_i, v_i, reset_i, w_i;
  input [63:0] data_i;
  input [8:0] addr_i;
  output [63:0] data_o;
  wire clk_i, v_i, reset_i, w_i;
  wire [63:0] data_i;
  wire [8:0] addr_i;
  wire [63:0] data_o;

  wire [31:0] rd_lo_0, rd_hi_0;   // bank 0 output
  wire [31:0] rd_lo_1, rd_hi_1;   // bank 1 output
  reg  bank_sel_r;

  always @(posedge clk_i) bank_sel_r <= addr_i[8];
  assign data_o = bank_sel_r ? {rd_hi_1, rd_lo_1} : {rd_hi_0, rd_lo_0};

  // Bank 0 (addr[8] == 0) – lower 32 bits
  fakeram7_256x32 mem0_lo (
    .clk     (clk_i),
    .rd_out  (rd_lo_0),
    .ce_in   (~addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[31:0]),
    .addr_in (addr_i[7:0])
  );

  // Bank 0 – upper 32 bits
  fakeram7_256x32 mem0_hi (
    .clk     (clk_i),
    .rd_out  (rd_hi_0),
    .ce_in   (~addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[63:32]),
    .addr_in (addr_i[7:0])
  );

  // Bank 1 (addr[8] == 1) – lower 32 bits
  fakeram7_256x32 mem1_lo (
    .clk     (clk_i),
    .rd_out  (rd_lo_1),
    .ce_in   (addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[31:0]),
    .addr_in (addr_i[7:0])
  );

  // Bank 1 – upper 32 bits
  fakeram7_256x32 mem1_hi (
    .clk     (clk_i),
    .rd_out  (rd_hi_1),
    .ce_in   (addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[63:32]),
    .addr_in (addr_i[7:0])
  );

endmodule

// hard_mem_1rw_bit_mask_d64_w96_wrapper
// One fakeram7_64x256 macro; lower 96 bits used.
// Bit-mask (w_mask_i) is not supported by this macro and is ignored.
module hard_mem_1rw_bit_mask_d64_w96_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, w_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [95:0] data_i, w_mask_i;
  input [5:0] addr_i;
  output [95:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [95:0] data_i, w_mask_i;
  wire [5:0] addr_i;
  wire [95:0] data_o;

  wire [255:0] rd_out;
  wire [255:0] wd_wide;

  assign wd_wide = {{160{1'b0}}, data_i};
  assign data_o  = rd_out[95:0];

  fakeram7_64x256 mem (
    .clk     (clk_i),
    .rd_out  (rd_out),
    .ce_in   (1'b1),
    .we_in   (w_i),
    .wd_in   (wd_wide),
    .addr_in (addr_i)
  );

endmodule

// hard_mem_1rw_byte_mask_d512_w64_wrapper
// Four fakeram7_256x32 macros: 2 depth-banks x 2 width-columns.
// Byte-mask (write_mask_i) is not supported by this macro and is ignored.
module hard_mem_1rw_byte_mask_d512_w64_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, write_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [63:0] data_i;
  input [8:0] addr_i;
  input [7:0] write_mask_i;
  output [63:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [63:0] data_i;
  wire [8:0] addr_i;
  wire [7:0] write_mask_i;
  wire [63:0] data_o;

  wire [31:0] rd_lo_0, rd_hi_0;
  wire [31:0] rd_lo_1, rd_hi_1;
  reg  bank_sel_r;

  always @(posedge clk_i) bank_sel_r <= addr_i[8];
  assign data_o = bank_sel_r ? {rd_hi_1, rd_lo_1} : {rd_hi_0, rd_lo_0};

  fakeram7_256x32 mem0_lo (
    .clk     (clk_i),
    .rd_out  (rd_lo_0),
    .ce_in   (~addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[31:0]),
    .addr_in (addr_i[7:0])
  );

  fakeram7_256x32 mem0_hi (
    .clk     (clk_i),
    .rd_out  (rd_hi_0),
    .ce_in   (~addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[63:32]),
    .addr_in (addr_i[7:0])
  );

  fakeram7_256x32 mem1_lo (
    .clk     (clk_i),
    .rd_out  (rd_lo_1),
    .ce_in   (addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[31:0]),
    .addr_in (addr_i[7:0])
  );

  fakeram7_256x32 mem1_hi (
    .clk     (clk_i),
    .rd_out  (rd_hi_1),
    .ce_in   (addr_i[8]),
    .we_in   (w_i),
    .wd_in   (data_i[63:32]),
    .addr_in (addr_i[7:0])
  );

endmodule

// hard_mem_1rw_bit_mask_d64_w7_wrapper
// One fakeram7_64x28 macro; lower 7 bits used.
// Bit-mask (w_mask_i) is not supported by this macro and is ignored.
module hard_mem_1rw_bit_mask_d64_w7_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, w_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [6:0] data_i, w_mask_i;
  input [5:0] addr_i;
  output [6:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [6:0] data_i, w_mask_i;
  wire [5:0] addr_i;
  wire [6:0] data_o;

  wire [27:0] rd_out;
  wire [27:0] wd_wide;

  assign wd_wide = {{21{1'b0}}, data_i};
  assign data_o  = rd_out[6:0];

  fakeram7_64x28 mem (
    .clk     (clk_i),
    .rd_out  (rd_out),
    .ce_in   (1'b1),
    .we_in   (w_i),
    .wd_in   (wd_wide),
    .addr_in (addr_i)
  );

endmodule

// hard_mem_1rw_bit_mask_d64_w15_wrapper
// One fakeram7_64x28 macro; lower 15 bits used.
// Bit-mask (w_mask_i) is not supported by this macro and is ignored.
module hard_mem_1rw_bit_mask_d64_w15_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, w_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [14:0] data_i, w_mask_i;
  input [5:0] addr_i;
  output [14:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [14:0] data_i, w_mask_i;
  wire [5:0] addr_i;
  wire [14:0] data_o;

  wire [27:0] rd_out;
  wire [27:0] wd_wide;

  assign wd_wide = {{13{1'b0}}, data_i};
  assign data_o  = rd_out[14:0];

  fakeram7_64x28 mem (
    .clk     (clk_i),
    .rd_out  (rd_out),
    .ce_in   (1'b1),
    .we_in   (w_i),
    .wd_in   (wd_wide),
    .addr_in (addr_i)
  );

endmodule

// hard_mem_1rw_d256_w95_wrapper
// One fakeram7_256x256 macro; lower 95 bits used.
module hard_mem_1rw_d256_w95_wrapper(clk_i, v_i, reset_i, data_i,
     addr_i, w_i, data_o);
  input clk_i, v_i, reset_i, w_i;
  input [94:0] data_i;
  input [7:0] addr_i;
  output [94:0] data_o;
  wire clk_i, v_i, reset_i, w_i;
  wire [94:0] data_i;
  wire [7:0] addr_i;
  wire [94:0] data_o;

  wire [255:0] rd_out;
  wire [255:0] wd_wide;

  assign wd_wide = {{161{1'b0}}, data_i};
  assign data_o  = rd_out[94:0];

  fakeram7_256x256 mem (
    .clk     (clk_i),
    .rd_out  (rd_out),
    .ce_in   (1'b1),
    .we_in   (w_i),
    .wd_in   (wd_wide),
    .addr_in (addr_i)
  );

endmodule
