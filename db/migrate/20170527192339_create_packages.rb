class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.timestamps
    end
  end
end
