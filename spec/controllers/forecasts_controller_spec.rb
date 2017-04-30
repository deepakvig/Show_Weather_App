require 'rails_helper'

RSpec.describe ForecastsController, type: :controller do

  describe "GET #index" do
    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @locations" do
      expect(assigns(:locations)).to_not be_nil
    end

    it "@locations count" do
      expect(assigns(:locations).length).to eq(5)
    end

    it "@locations is an array of Location" do
      expect(assigns(:locations)).to all( be_a(Location) )
    end 
  end

end
