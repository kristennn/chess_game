class AddDiamondToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :diamond, :integer
  end
end
