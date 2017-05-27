require 'rails_helper'

RSpec.describe WashException, type: :model do

  it "creates a wash exception" do

      wash_exception = WashException.create(
      name: "Open Bed",
      description: "Bed is let down")

      expect( wash_exception.name).to eq( "Open Bed")
      expect( wash_exception.description).to eq("Bed is let down")

    end

end
