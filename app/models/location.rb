class Location
  include WeatherDetail
  
  # Reference Latitude
  REF_LAT = 0
  # Reference Longitude
  REF_LON = 0
  # for finding coordinates with RANGE 10,000Km
  WITH_IN_METERS = 10000000

  ATTRS = [:lat, :lon, :city, :country, :temperature, :pressure, :humidity, :min_temperature, :max_temperature, 
                :clouds, :wind_speed, :wind_angle]

  attr_accessor(*ATTRS)

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def weather_detail
    res = get_weather_details lat: self.lat, lon: self.lon
    ATTRS.each do |attr|
      send("#{attr.to_s}=", res[attr])
    end 
    self.lat = res[:latitude]
    self.lon = res[:longitude]
  end

  def self.random_geo_coord limit = 5
    locs = []
    limit.times do
      lat, lon = RandomLocation.near_by( REF_LAT, REF_LON, WITH_IN_METERS )
      locs << self.new(lat: lat, lon: lon)
    end
    return locs
  end

  def self.random_geo_coord_with_weather_details limit = 5
    self.random_geo_coord( limit ).each do |loc|
      loc.weather_detail
    end
  end  
end