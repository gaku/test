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
  puts builder.to_xml
end

if (ARGV.length != 1)
  $stderr.puts "ruby dp.rb <input_gpx_file>"
  exit 1
end
gpx = GPX::GpxFile.new(ARGV[0])
gpx.parse_file

dp = DP::DouglasPeucker.new(gpx.points, 0.0001)
simplified_points = dp.simplify
dump_gpx(simplified_points)