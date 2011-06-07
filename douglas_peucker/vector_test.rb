require 'rubygems'
require 'test/unit'
require 'vector'

class VectorTest < Test::Unit::TestCase
  def test_dot_product
    a = DP::Vector.new(1, 1)
    b = DP::Vector.new(2, -1)
    assert_equal(1 * 2 + 1 * (-1), a.dot_product(b))
  end

  def test_magnitude
    v = DP::Vector.new(2, 3)
    assert_equal(Math.sqrt(13), v.magnitude)
  end

end
