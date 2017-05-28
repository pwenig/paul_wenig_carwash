class AddLicenseColToWash < ActiveRecord::Migration[5.1]
  def change
    add_column :washes, :license, :string
  end
end
