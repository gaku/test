module DP
  class Vector
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def dot_product(v)
      return @x * v.x + @y * v.y
    end 
  end
end
