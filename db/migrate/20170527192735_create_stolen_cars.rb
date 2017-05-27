class CreateStolenCars < ActiveRecord::Migration[5.1]
  def change
    create_table :stolen_cars do |t|
      t.string :license
      t.timestamps
    end
  end
end
