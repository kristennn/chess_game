class AddDiamondToPlayertype < ActiveRecord::Migration[5.1]
  def change
    add_column :player_types, :diamond, :integer, default: 2000
  end
end
