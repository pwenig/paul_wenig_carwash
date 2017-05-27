require 'rails_helper'

RSpec.describe Package, type: :model do

  it "creates a package" do

    package = Package.create(
      name: "Standard Car",
      description: "Basic wash for a car",
      price: 5.00)

    expect( package.name).to eq( "Standard Car")
    expect( package.description).to eq( "Basic wash for a car")
    expect( package.price).to eq( 5.00 )
    
  end

end
