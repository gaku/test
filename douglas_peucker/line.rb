module DP
  class Line
    def initialize(p1, p2)
      @p1 = p1
      @p2 = p2
    end

    def length_squared
      dx = @p1.x - @p2.x
      dy = @p1.y - @p2.y
      return dx * dx + dy * dy
    end

    def distance_to_point_squared(point)
      v = DP.Vector.new(point.x - @p1.x, point.y - @p2.y)
      l = DP.Vector.new(@p2.x - @p1.x, @p2.y - @p1.y)
      dot = v.dot_product(l.unit_vector)

      if (dot <= 0)
        dl = Line.new(@p1, point)
        return dl.length_squared
      end


    end
  end
end
