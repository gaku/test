require 'point'

module GPX
  class GeoPoint < DP::Point
    alias :lat :y
    alias :lat= :y=
    alias :lng :x
    alias :lng= :x=
    
    def initialize(lat, lng)
      super(lng, lat)
    end
  end
end
