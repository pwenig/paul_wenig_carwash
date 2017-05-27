require 'rails_helper'

RSpec.describe Customer, type: :model do

   it "creates a customer" do

    customer = Customer.create(
      first_name: "Saul",
      last_name: "Goodman",
      license: "LWYRUP"
    )
    expect( customer.first_name).to eq('Saul')
    expect( customer.last_name).to eq('Goodman')
    expect( customer.license).to eq('LWYRUP')
    
  end

  it "creates a customer wash" do

     customer = Customer.create(
      first_name: "Saul",
      last_name: "Goodman",
      license: "LWYRUP")

     package = Package.create(
      name: "Standard Car",
      description: "Basic wash for a car",
      price: 5.00)

    wash = Wash.create(
      amount: 5.00,
      package_id: package.id,
      customer_id: customer.id)

    customer = Customer.find(customer.id)
    customer.update_attribute(:wash_id, wash.id)

    expect(customer.washes.first.amount).to eq(5.00)
    expect(customer.washes.first.package.name).to eq("Standard Car")


  end
  

 
end
