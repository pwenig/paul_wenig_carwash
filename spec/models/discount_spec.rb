require 'rails_helper'

RSpec.describe Discount, type: :model do

  it "creates a discount" do

    discount = Discount.create(
      name: "2nd Visit Discount",
      threshold: 2,
      equator: 'equal')

    expect( discount.name).to eq("2nd Visit Discount")
    expect( discount.threshold).to eq(2)
    expect( discount.equator).to eq( "equal" )
    
  end

end
