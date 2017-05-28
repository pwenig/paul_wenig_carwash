class AddExceptionsToWashes < ActiveRecord::Migration[5.1]
  def change
     add_reference :washes, :wash_exception, foreign_key: true
  end
end
