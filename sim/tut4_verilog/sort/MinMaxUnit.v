//========================================================================
// MinMaxUnit
//========================================================================
// This module takes two inputs, compares them, and outputs the larger
// via the "max" output port and the smaller via the "min" output port.

`ifndef TUT4_VERILOG_SORT_MIN_MAX_UNIT_V
`define TUT4_VERILOG_SORT_MIN_MAX_UNIT_V

module tut4_verilog_sort_MinMaxUnit
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  output logic [p_nbits-1:0] out_min,
  output logic [p_nbits-1:0] out_max
);

  // ''' TUTORIAL TASK '''''''''''''''''''''''''''''''''''''''''''''''''''
  // This model is incomplete. As part of the tutorial you will insert
  // logic here to implement the min/max unit. You should also write a
  // unit test from scratch named MinMaxUnit_test.py.
  // '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  always_comb begin
    if ( in0 <= in1) begin
      out_min = in0;
      out_max = in1;
    end
    else if ( in0 > in1 ) begin
      out_min = in1;
      out_max = in0;
    end
    else begin
      out_min = 'x;
      out_max = 'x;
    end
  end

endmodule

`endif /* TUT4_VERILOG_SORT_MIN_MAX_UNIT_V */

