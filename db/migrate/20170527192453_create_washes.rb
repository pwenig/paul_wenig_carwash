class CreateWashes < ActiveRecord::Migration[5.1]
  def change
    create_table :washes do |t|
      t.integer :amount
      t.belongs_to :package
      t.belongs_to :addon
      t.timestamps
    end
  end
end
