class Location
  
  # Reference Latitude
  REF_LAT = 0
  # Reference Longitude
  REF_LON = 0
  # for finding coordinates with RANGE 10,000Km
  WITH_IN_METERS = 10000000

  attr_accessor :lat, :lon

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.random_geo_coord limit = 5
    locs = []
    limit.times do
      lat, lon = RandomLocation.near_by( REF_LAT, REF_LON, WITH_IN_METERS )
      locs << self.new(lat: lat, lon: lon)
    end
    return locs
  end

end