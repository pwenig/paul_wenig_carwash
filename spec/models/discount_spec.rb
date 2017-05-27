require 'rails_helper'

RSpec.describe Discount, type: :model do

  it "creates a discount" do

    discount = Discount.create(
      name: "2nd Visit Discount",
      threshold: 2,
      equator: 'equal',
      amount: 0.50)

    expect( discount.name).to eq("2nd Visit Discount")
    expect( discount.threshold).to eq(2)
    expect( discount.equator).to eq("equal")
    expect( discount.amount).to eq(0.50)
    
  end

end
