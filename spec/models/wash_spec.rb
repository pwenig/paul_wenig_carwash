require 'rails_helper'

RSpec.describe Wash, type: :model do

   it "reutrns a wash price" do
    
     wash = Wash.create(
       amount: 15.00)

    expect( wash.amount).to eq(15.00)

  end

  it "returns a wash package" do

     package = Package.create(
      name: "Standard Car",
      description: "Basic wash for a car",
      price: 5.00)

    wash = Wash.create(
      amount: 5.00,
      package_id: package.id
    )


    expect(wash.amount).to eq(5.00)
    expect(wash.package.name).to eq("Standard Car")
    expect(wash.package.price).to eq(5.00)
  
  end

  it "returns a wash addon" do

     package = Package.create(
      name: "Standard Truck",
      description: "Basic wash for a truck",
      price: 5.00)

    addon = Addon.create(
      name: "Muddy Bed",
      description: "The truck has mud in the bed",
      price: 2.00)

    wash = Wash.create(
      amount: 7.00,
      package_id: package.id,
      addon_id: addon.id
    )
    
    expect(wash.amount).to eq(7.00)
    expect(wash.package.name).to eq("Standard Truck")
    expect(wash.addon.name).to eq("Muddy Bed")
  
  end


end
