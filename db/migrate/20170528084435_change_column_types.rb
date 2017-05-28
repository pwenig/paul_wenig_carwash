class ChangeColumnTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :washes, :amount, :string
    remove_column :washes, :license
  end
end
