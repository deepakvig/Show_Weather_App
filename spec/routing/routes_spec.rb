require 'rails_helper'
 
describe "Routes" do
  describe "ForecastsController" do
    it "routes get index" do
      expect(:get => "/").to route_to(
        :controller => "forecasts",
        :action => "index"
      )
    end 
  end

  describe "LocationsController" do
    it "routes post create" do
      expect(:post => "locations").to route_to(
        :controller => "locations",
        :action => "create"
      )
    end 
  end

end