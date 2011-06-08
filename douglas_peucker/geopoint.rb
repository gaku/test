require 'point'

module GPX
  class GeoPoint < DP::Point
    alias :lat :y
    alias :lat= :y=
    alias :lon :x
    alias :lon= :x=
    
    def initialize(lat, lon)
      super(lon, lat)
    end
  end
end
