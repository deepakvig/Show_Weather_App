class LocationsController < ApplicationController
  
  def create
    loc = Location.new(location_params)
    loc.validate_city
    
    if loc.errors.any?
      @errors = loc.errors
    else
      @location = loc.weather_detail
    end
  end

  private

  def location_params
    params.require(:location).permit(:city, :country)
  end

end
