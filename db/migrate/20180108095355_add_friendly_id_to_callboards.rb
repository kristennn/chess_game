class AddFriendlyIdToCallboards < ActiveRecord::Migration[5.1]
  def change
    add_column :callboards, :friendly_id, :string
    add_index :callboards, :friendly_id, :unique => true

    Callboard.find_each do |c|
      c.update( :friendly_id => SecureRandom.uuid )
    end
  end
end
