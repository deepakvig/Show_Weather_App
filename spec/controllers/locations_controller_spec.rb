require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  let(:valid_attributes) {
    {city: 'London', country: 'GB'}
  }

  let(:invalid_attributes) {
    {city: '', country: ''}
  }

  describe "POST #create" do
    context "with valid params" do
      before do
        post :create, params: {location: valid_attributes}, xhr: true
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns a location as @location" do
        expect(assigns(:location)).to be_a(Location)
        expect(assigns(:location)).not_to be_persisted
      end

      it "renders the 'create' template" do
        expect(response).to render_template("create")
      end
    end

    context "with invalid params" do
      before do
        post :create, params: {location: invalid_attributes}
      end

      it "assigns a location as @location" do
        expect(assigns(:errors)).not_to be_nil
      end

      it "renders the 'create' template" do
        expect(response).to render_template("create")
      end
    end
  end

end