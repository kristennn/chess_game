class AddRateToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rate, :float
  end
end
