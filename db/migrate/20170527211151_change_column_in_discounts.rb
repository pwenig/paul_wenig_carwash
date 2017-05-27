class ChangeColumnInDiscounts < ActiveRecord::Migration[5.1]
  def change
    change_column :discounts, :amount, :decimal
  end
end
