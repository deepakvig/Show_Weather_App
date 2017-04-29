require 'rails_helper'

RSpec.describe Location, type: :model do

  describe "check attributes" do
    before do
      @location = Location.new
    end
  
    it "should include the :lat attribute" do
      expect(@location).to respond_to(:lat)
    end
  
    it "should include the :lon attribute" do
      expect(@location).to respond_to(:lon)
    end
  end

  describe "Class method" do
    it "should include class method random_geo_coord" do
      expect(Location).to respond_to(:random_geo_coord)
    end

    describe "should return" do
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
  end

end