require 'rubygems'
require 'test/unit'
require 'line'
require 'point'

class LineTest < Test::Unit::TestCase
  def test_length_squared
    line = DP::Line.new(DP::Point.new(3,2), DP::Point.new(1,1))
    assert_equal(5, line.length_squared)
  end
end