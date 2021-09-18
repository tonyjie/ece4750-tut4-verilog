#=========================================================================
# MinMaxUnit_test
#=========================================================================

from pymtl   import *
from MinMaxUnit import MinMaxUnit

# In py.test, unit tests are simply functions that begin with a "test_"
# prefix. PyMTL is setup to simplify dumping VCD. Simply specify
# "dump_vcd" as an argument to your unit test, and then you can dump VCD
# with the --dump-vcd option to py.test.

def test_basic( dump_vcd ):

  # Elaborate the model

  model = MinMaxUnit()
  model.vcd_file = dump_vcd
  model.elaborate()

  # Create and reset simulator

  sim = SimulationTool( model )
  sim.reset()
  print ""

  # Helper function

  def t( in0, in1, out_min, out_max ):

    # Write input value to input port

    model.in0.value = in0
    model.in1.value = in1

    # Ensure that all combinational concurrent blocks are called

    sim.eval_combinational()

    # Display a line trace

    sim.print_line_trace()

    # If reference output is not '?', verify value read from output port

    if ( out_min != '?' ):
      assert model.out_min == out_min
    if ( out_max != '?' ):
      assert model.out_max == out_max

    # Tick simulator one cycle

    sim.cycle()

  # Cycle-by-cycle tests

  t( 0x00, 0x02, 0x00, 0x02  )
  t( 0x13, 0x21, 0x13, 0x21 )
  t( 0x27, 0x14, 0x14, 0x27 )
  t( 0x30, 0x28, 0x28, 0x30 )
  t( 0x00, 0x01, 0x00, 0x01 )
  t( 0x20, 0x14, 0x14, 0x20 )

