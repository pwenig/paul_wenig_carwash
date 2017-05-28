require 'rails_helper'

RSpec.describe PackagesController, type: :controller do

  describe "GET" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST" do
    it "returns http success" do
       post :create, params: {package: {name: "Basic Car", description: "Standard Wash", price: "5.00"}}
      expect(response).to redirect_to(packages_path)
    end
  end


end