class CreatePlayerTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :player_types do |t|
      t.integer :uid
      t.string  :name
      t.integer :gold
      t.boolean :online, default: false
      t.integer :sex, default: 0
      t.integer :viptype
      t.string  :headimgurl
      t.integer :score
      t.timestamps
    end
  end
end
