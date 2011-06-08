require 'gpx'
require 'douglas_peucker'
require 'nokogiri'

# a test program to read a GPX file and simply with Douglas Peucker algorithm.

def dump_gpx(points)
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.gpx {
      xml.trk {
        xml.trkseg {
          points.each { |p|
            xml.trkpt(:lat => p.lat, :lon => p.lon)
          }
        }
      }
    }
  end
  File.open("simpler.gpx", 'w') do |f|
    f.puts builder.to_xml
  end
end


gpx = GPX::GpxFile.new('/Users/gaku/safe/gps/Current.gpx')
gpx.parse_file

File.open("myoutput", 'w') do |f|
  index = 0
  gpx.points.each do |p|
    f.puts "#{index}: #{p}"
    index += 1
  end
end

dp = DP::DouglasPeucker.new(gpx.points, 0.0001)
simplified_points = dp.simplify
puts "original: #{gpx.points.length}"
puts "simplified: #{simplified_points.length}"
dump_gpx(simplified_points)