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
    v1 = DP::Vector.new(2, 3)
    assert_equal(Math.sqrt(13), v1.magnitude)

    v2 = DP::Vector.new(0, 0)
    assert_equal(0, v2.magnitude)
  end

end
