require 'rubygems'
require 'test/unit'
require 'point'
require 'douglas_peucker'

class DouglasPeuckerTest < Test::Unit::TestCase
  def test_simplification
    inputs = [DP::Point.new(0,0), DP::Point.new(1,1), DP::Point.new(2,2), DP::Point.new(3,1),
             DP::Point.new(4,0)]
    dp = DP::DouglasPeucker.new(inputs, 1.5)
    outputs = dp.simplify
    assert_equal(3, outputs.length)
    assert_equal(DP::Point.new(2,2), outputs[1])
  end
end