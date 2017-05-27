class AddCustomerToWashes < ActiveRecord::Migration[5.1]
  def change
    add_reference :washes, :customer, foreign_key: true
  end
end
