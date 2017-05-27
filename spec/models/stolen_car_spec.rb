require 'rails_helper'

RSpec.describe StolenCar, type: :model do

    it "creates a stolen car" do

      stolen_car = StolenCar.create(
      license: "1111111")

      expect( stolen_car.license).to eq( "1111111")

    end
  
end
