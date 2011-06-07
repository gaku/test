require 'rubygems'
require 'test/unit'
require 'line'
require 'point'

class LineTest < Test::Unit::TestCase
  def test_length_squared
    line = DP::Line.new(DP::Point.new(3,2), DP::Point.new(1,1))
    assert_equal(5, line.length_squared)
  end

  def test_distance_to_point_squared
    # line: y = 2x
    line = DP::Line.new(DP::Point.new(0,0), DP::Point.new(1, Math.sqrt(3)))
    point = DP::Point.new(0, Math.sqrt(3))
    assert_in_delta(0.75, line.distance_to_point_squared(point), 0.001)

    # point2 is smaller than the line : (0,0) is the closest
    point2 = DP::Point.new(-1, 0)
    assert_in_delta(1, line.distance_to_point_squared(point2), 0.001)

    # point3 is beyond the line : (1,sqrt(3)) is the closest
    point3 = DP::Point.new(2, Math.sqrt(3))
    assert_in_delta(1, line.distance_to_point_squared(point3), 0.001)
  end
end