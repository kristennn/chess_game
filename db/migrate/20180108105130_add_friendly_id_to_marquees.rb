class AddFriendlyIdToMarquees < ActiveRecord::Migration[5.1]
  def change
    add_column :marquees, :friendly_id, :string
    add_index :marquees, :friendly_id, :unique => true
  end
end
