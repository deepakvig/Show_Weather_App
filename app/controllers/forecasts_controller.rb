class ForecastsController < ApplicationController
  def index
    @locations = Location.random_geo_coord_with_weather_details
  end
end
