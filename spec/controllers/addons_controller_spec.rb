require 'rails_helper'

RSpec.describe AddonsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST" do
    it "returns http success" do
       post :create, params: {addon: {name: "Very Dirty", description: "Very Dirty", price: 2.00}}
      expect(response).to redirect_to(addons_path)
    end
  end



end