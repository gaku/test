require 'rubygems'
require 'test/unit'
require 'point'

class PointTest < Test::Unit::TestCase
  def test_equals
    a = DP::Point.new(1,2)
    b = DP::Point.new(1,2)
    assert_equal(true, a == b)

    c = DP::Point.new(1,3)
    assert_equal(false, a == c)
  end
end