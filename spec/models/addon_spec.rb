require 'rails_helper'

RSpec.describe Addon, type: :model do

  it "creates an add-on" do

    addon = Addon.create(
      name: "Muddy Bed",
      description: "The truck has mud in the bed",
      price: 2.00)

    expect( addon.name).to eq( "Muddy Bed")
    expect( addon.description).to eq( "The truck has mud in the bed")
    expect( addon.price).to eq( 2.00 )
    
  end

end
