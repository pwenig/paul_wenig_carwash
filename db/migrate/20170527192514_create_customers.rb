class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :license
      t.string :first_name
      t.string :last_name
      t.belongs_to :wash
      t.timestamps
    end
  end
end
