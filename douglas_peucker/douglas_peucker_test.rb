require 'rubygems'
require 'test/unit'
require 'point'
require 'douglas_peucker'

class DouglasPeuckerTest < Test::Unit::TestCase
  def test_simplification
    # INPUT: [(0,0),(1,1),(2,2),(3,1),(4,0)]
    # OUTPUT: [(0,0),(2,2),(4,0)]
    inputs = [DP::Point.new(0,0), DP::Point.new(1,1), DP::Point.new(2,2), DP::Point.new(3,1),
             DP::Point.new(4,0)]
    dp = DP::DouglasPeucker.new(inputs, 1.5)
    outputs = dp.simplify
    assert_equal(3, outputs.length)
    assert_equal(DP::Point.new(2,2), outputs[1])
  end

  def test_simplification2
    # INPUT: [(0,0),(1, -0.5), (2,2), (3,-3), (4,-1), (5,-2), (6,0)]
    # OUTPUT: [(0,0),(2,2),(3,-3),(6,0)]
    inputs = [DP::Point.new(0,0), DP::Point.new(1,-0.5), DP::Point.new(2,2), DP::Point.new(3,-3),
             DP::Point.new(4,-1), DP::Point.new(5, -2), DP::Point.new(6,0)]
    dp = DP::DouglasPeucker.new(inputs, 2)
    outputs = dp.simplify
    assert_equal(4, outputs.length)
    assert_equal(DP::Point.new(2,2), outputs[1])
    assert_equal(DP::Point.new(3,-3), outputs[2])
  end
end