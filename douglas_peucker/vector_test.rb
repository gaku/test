require 'rubygems'
require 'test/unit'
require 'vector'

class VectorTest < Test::Unit::TestCase
  def test_dot_product
    a = DP::Vector.new(1, 1)
    b = DP::Vector.new(2, -1)
    assert_equal(1, a.dot_product(b))
  end
end
