require 'rails_helper'

RSpec.describe Location, type: :model do

  describe "check attributes" do
    before do
      @location = Location.new
    end
  
    it "should include all weather related attributes" do
      expect(@location).to respond_to(:lat)
      expect(@location).to respond_to(:lon)
      expect(@location).to respond_to(:city)
      expect(@location).to respond_to(:temperature)
      expect(@location).to respond_to(:pressure)
      expect(@location).to respond_to(:humidity)
      expect(@location).to respond_to(:min_temperature)
      expect(@location).to respond_to(:max_temperature)
      expect(@location).to respond_to(:clouds)
      expect(@location).to respond_to(:wind_speed)
      expect(@location).to respond_to(:wind_angle)
    end
  end

  describe "weather_detail" do
    it "should update location attributes" do
      @location = Location.new(lat: 0, lon: 0)
      @location.weather_detail
      expect(@location.city).to eq("London")
      expect(@location.temperature).to eq(280.32)
      expect(@location.pressure).to eq(1012)
      expect(@location.humidity).to eq(81)
      expect(@location.min_temperature).to eq(279.15)
      expect(@location.max_temperature).to eq(281.15)
      expect(@location.clouds).to eq(90)
      expect(@location.wind_speed).to eq(4.1)
      expect(@location.wind_angle).to eq(80)
    end
  end

  describe "Class method" do
    it "should include class method random_geo_coord" do
      expect(Location).to respond_to(:random_geo_coord)
    end

    it "should include class method random_geo_coord_with_weather_details" do
      expect(Location).to respond_to(:random_geo_coord_with_weather_details)
    end

    describe "should return 'random_geo_coord'" do
      it "locations array" do 
        expect(Location.random_geo_coord.first).to be_an_instance_of(Location)
      end

      it "locations of length 5 when no argument passed" do
        expect(Location.random_geo_coord.length).to eq(5)
      end

      it "locations of length equal to argument passed" do
        expect(Location.random_geo_coord(10).length).to eq(10)
      end
    end

    describe "should return 'random_geo_coord_with_weather_details'" do
      it "locations array" do 
        expect(Location.random_geo_coord_with_weather_details).to all(be_an_instance_of(Location))
      end

      it "locations of length 5 when no argument passed" do
        expect(Location.random_geo_coord_with_weather_details.length).to eq(5)
      end

      it "locations of length equal to argument passed" do
        expect(Location.random_geo_coord_with_weather_details(10).length).to eq(10)
      end
    end
  end

end