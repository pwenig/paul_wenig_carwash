require 'rails_helper'

RSpec.describe StolenCarsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

describe "POST" do
      it "returns http success" do
        post :create, params: {stolen_car: {license: "1111111"}}
        expect(response).to redirect_to(stolen_cars_path)
      end
    end

end