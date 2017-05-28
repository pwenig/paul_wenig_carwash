require 'rails_helper'

RSpec.describe DiscountsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

   describe "POST" do
    it "returns http success" do
       post :create, params: {discount: {name: "Very Dirty", threshold: 2, equator: 'equals', amount: 0.50}}
      expect(response).to redirect_to(discounts_path)
    end
  end

end