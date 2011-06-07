require 'line'
module DP
  class DouglasPeucker
    def initialize(original_points, tolerance)
      @original_points = original_points
      @tolerance_squared = tolerance * tolerance
      @output = {}
    end

    def simplify
      @output = {}
      # begining and ending points are always kept
      @output[@original_points[0]] = true
      @output[@original_points[@original_points.length - 1]] = true

      douglas_peucker(0, @original_points.length - 1, 0)

      return @original_points.select do |elem|
        @output[elem]
      end
    end

    def douglas_peucker(start_vertex_index, end_vertex_index, depth)
      puts "douglas(#{start_vertex_index}, #{end_vertex_index})"
      return if end_vertex_index <= (start_vertex_index + 1) # nothing to do.

      # make line from start to end
      line = DP::Line.new(@original_points[start_vertex_index], @original_points[end_vertex_index])

      # find largest distance from intermediate points to this line
      max_dist_to_line_squared = 0
      max_point = nil

      @original_points[start_vertex_index, end_vertex_index + 1].each do |point|      
        dist_to_line_squared = line.distance_to_point_squared(point)
        if (dist_to_line_squared > max_dist_to_line_squared)
          max_dist_to_line_squared = dist_to_line_squared
          max_point = point
        end
      end

      if max_dist_to_line_squared > @tolerance_squared
        # keep this point for output
        @output[max_point] = true
        # split the polyline at the farthest vertex
        index = @original_points.index(max_point)
	puts "#{depth} part 1"
        douglas_peucker(start_vertex_index, index, depth+1)
	puts "#{depth} part 2"
        douglas_peucker(index, end_vertex_index, depth+1)        
	puts "---"
      end
    end
  end
end

