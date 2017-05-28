require 'rails_helper'

RSpec.describe WashExceptionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST" do
      it "returns http success" do
        post :create, params: {wash_exception: {name: "Open Bed", description: "Bed is let down"}}
        expect(response).to redirect_to(wash_exceptions_path)
      end
    end


end