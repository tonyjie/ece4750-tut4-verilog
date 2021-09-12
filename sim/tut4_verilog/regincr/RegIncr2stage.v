//========================================================================
// RegIncr2stage
//========================================================================
// Two-stage registered incrementer that uses structural composition to
// instantitate and connect two instances of the single-stage registered
// incrementer.

`ifndef TUT4_VERILOG_REGINCR_REG_INCR_2STAGE_V
`define TUT4_VERILOG_REGINCR_REG_INCR_2STAGE_V

`include "tut4_verilog/regincr/RegIncr.v"
// `include "/home/jl4257/ece4750/tut4/sim/tut4_verilog/regincr/RegIncr.v"

module tut4_verilog_regincr_RegIncr2stage
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in,
  output logic [7:0] out
);

  // First stage

  logic [7:0] reg_incr_0_out;

  tut4_verilog_regincr_RegIncr reg_incr_0
  (
    .clk   (clk),
    .reset (reset),
    .in    (in),
    .out   (reg_incr_0_out)
  );

  tut4_verilog_regincr_RegIncr reg_incr_1
  (
    .clk  (clk),
    .reset (reset),
    .in   (reg_incr_0_out),
    .out  (out)
  );

endmodule

`endif /* TUT4_VERILOG_REGINCR_REG_INCR_2STAGE_V */

