require 'rails_helper'

RSpec.describe WeatherDetail do

  subject { Object.new.extend(WeatherDetail) }

  it "should have instance method get_weather_details" do
    expect(subject).to respond_to(:get_weather_details)
  end

  it "should get proper response with proper keys" do
    expect(subject.get_weather_details).to have_key(:city)
    expect(subject.get_weather_details).to have_key(:country)
    expect(subject.get_weather_details).to have_key(:longitude)
    expect(subject.get_weather_details).to have_key(:latitude)
    expect(subject.get_weather_details).to have_key(:temperature)
    expect(subject.get_weather_details).to have_key(:pressure)
    expect(subject.get_weather_details).to have_key(:humidity)
    expect(subject.get_weather_details).to have_key(:min_temperature)
    expect(subject.get_weather_details).to have_key(:max_temperature)
    expect(subject.get_weather_details).to have_key(:clouds)
    expect(subject.get_weather_details).to have_key(:wind_speed)
    expect(subject.get_weather_details).to have_key(:wind_angle)
  end
  
end