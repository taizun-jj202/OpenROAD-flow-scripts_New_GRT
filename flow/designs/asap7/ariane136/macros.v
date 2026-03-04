module SyncSpRamBeNx64_00000008_00000100_0_2
  (
   Clk_CI,
   Rst_RBI,
   CSel_SI,
   WrEn_SI,
   BEn_SI,
   WrData_DI,
   Addr_DI,
   RdData_DO
   );

   input [7:0]   BEn_SI;
   input [63:0]  WrData_DI;
   input [7:0]   Addr_DI;
   output [63:0] RdData_DO;
   input         Clk_CI;
   input         Rst_RBI;
   input         CSel_SI;
   input         WrEn_SI;

   fakeram_256x64 macro_mem_00 (
     .clk     (Clk_CI),
     .rd_out  (RdData_DO),
     .ce_in   (CSel_SI),
     .we_in   (WrEn_SI),
     .wd_in   (WrData_DI),
     .addr_in (Addr_DI)
   );

endmodule // SyncSpRamBeNx64_00000008_00000100_0_2

// Google made a mistake in their ariane experiment.
// The valid_dirty_sram should be 4 macros, each 256x16. Instead, they only instantiated 1 256x16 macro.
module limping_SyncSpRamBeNx64_00000008_00000100_0_2
  (
   Clk_CI,
   Rst_RBI,
   CSel_SI,
   WrEn_SI,
   BEn_SI,
   WrData_DI,
   Addr_DI,
   RdData_DO
   );

   input [7:0]   BEn_SI;
   input [63:0]  WrData_DI;
   input [7:0]   Addr_DI;
   output [63:0] RdData_DO;
   input         Clk_CI;
   input         Rst_RBI;
   input         CSel_SI;
   input         WrEn_SI;

   fakeram_256x64 macro_mem_00 (
     .clk     (Clk_CI),
     .rd_out  (RdData_DO),
     .ce_in   (CSel_SI),
     .we_in   (WrEn_SI),
     .wd_in   (WrData_DI),
     .addr_in (Addr_DI)
   );

endmodule // limping_SyncSpRamBeNx64_00000008_00000100_0_2

module SyncSpRamBeNx64_00000008_00000100_0_2_d45
  (
   Clk_CI,
   Rst_RBI,
   CSel_SI,
   WrEn_SI,
   BEn_SI,
   WrData_DI,
   Addr_DI,
   RdData_DO
   );

   input [7:0]   BEn_SI;
   input [44:0]  WrData_DI;
   input [7:0]   Addr_DI;
   output [44:0] RdData_DO;
   input         Clk_CI;
   input         Rst_RBI;
   input         CSel_SI;
   input         WrEn_SI;

   wire [63:0] rd_data_wide;
   wire [63:0] wd_data_wide;

   assign wd_data_wide = {19'b0, WrData_DI};
   assign RdData_DO = rd_data_wide[44:0];

   fakeram_256x64 macro_mem_00 (
     .clk     (Clk_CI),
     .rd_out  (rd_data_wide),
     .ce_in   (CSel_SI),
     .we_in   (WrEn_SI),
     .wd_in   (wd_data_wide),
     .addr_in (Addr_DI)
   );

endmodule // SyncSpRamBeNx64_00000008_00000100_0_2_d45

module SyncSpRamBeNx64_00000008_00000100_0_2_d44
  (
   Clk_CI,
   Rst_RBI,
   CSel_SI,
   WrEn_SI,
   BEn_SI,
   WrData_DI,
   Addr_DI,
   RdData_DO
   );

   input [7:0]   BEn_SI;
   input [43:0]  WrData_DI;
   input [7:0]   Addr_DI;
   output [43:0] RdData_DO;
   input         Clk_CI;
   input         Rst_RBI;
   input         CSel_SI;
   input         WrEn_SI;

   wire [63:0] rd_data_wide;
   wire [63:0] wd_data_wide;

   assign wd_data_wide = {20'b0, WrData_DI};
   assign RdData_DO = rd_data_wide[43:0];

   fakeram_256x64 macro_mem_00 (
     .clk     (Clk_CI),
     .rd_out  (rd_data_wide),
     .ce_in   (CSel_SI),
     .we_in   (WrEn_SI),
     .wd_in   (wd_data_wide),
     .addr_in (Addr_DI)
   );

endmodule // SyncSpRamBeNx64_00000008_00000100_0_2_d44
