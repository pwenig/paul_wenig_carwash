require 'rails_helper'

RSpec.describe Wash, type: :model do

   it "reutrns a wash price" do
    
     wash = Wash.create(
       amount: 15.00)

    expect( wash.amount).to eq("15.0")

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


    expect(wash.amount).to eq("5.0")
    expect(wash.package.name).to eq("Standard Car")
    expect(wash.package.price).to eq(5)
  
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
    
    expect(wash.amount).to eq("7.0")
    expect(wash.package.name).to eq("Standard Truck")
    expect(wash.addon.name).to eq("Muddy Bed")
  
  end

  it "looks up a stolen car" do
    stolen_car = StolenCar.create(license: '1111')
    my_car = '2222'
    stolen = Wash.is_stolen(stolen_car.license)
    not_stolen = Wash.is_stolen(my_car)
    expect(stolen).to eq(true)
    expect(not_stolen).to eq(false)

  end

  it "checks for a discount" do

     customer = Customer.create(
      first_name: "Saul",
      last_name: "Goodman",
      license: "LWYRUP")

     package = Package.create(
      name: "Standard Car",
      description: "Basic wash for a car",
      price: 5.00)

    wash1 = Wash.create(
      amount: 5.00,
      package_id: package.id,
      customer_id: customer.id)

    customer = Customer.find(customer.id)
    customer.update_attribute(:wash_id, wash1.id)

    wash_discount = Discount.create(
      name: "2nd Visit Discount",
      threshold: 2,
      equator: 'equal',
      amount: 0.50)

    discount = Wash.discount(customer.washes.length)

    expect(discount).to eq(0.50)

   end
  
   it "calculates a total" do

     package = Package.create(
      name: "Standard Car",
      description: "Basic wash for a car",
      price: 5.00)

     addon = Addon.create(
      name: "Muddy Bed",
      description: "The truck has mud in the bed",
      price: 2.00)

      wash_object = {'package_id' => package.id, 'addon_id' => addon.id}
      total = Wash.calculate_total(wash_object)

      expect(total).to eq(7)

    end

end
