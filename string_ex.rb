require 'rubygems'
require 'test/unit'
require 'rspec'

class StringTest < Test::Unit::TestCase
  def test_lstrip
    # "lstrip removes spaces from the begining"
    str = "  hello world"
    assert "hello world", str.lstrip
  end
end

