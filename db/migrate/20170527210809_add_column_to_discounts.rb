class AddColumnToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :amount, :integer
  end
end
