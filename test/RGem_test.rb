require './test/test_helper'

class RGemTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RGem::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  def test_that_it_handles_wrong_input
    assert_nil ::RGem.solve(0,1)
    assert_nil ::RGem.solve(25, 0)
    assert_nil ::RGem.solve(5, 'g')
  end

  def test_that_it_handles_linear_equation
    assert_equal  "29=(899)*(-6)+(493)*(11)", ::RGem.solve(899,493)
    assert_equal   "7=(1547)*(21)+(560)*(-58)", ::RGem.solve(1547,560)
  end
end
