class CreatePlayerRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :player_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :player_relationships, :follower_id
    add_index :player_relationships, :followed_id
    add_index :player_relationships, [:follower_id, :followed_id], unique: true #多键索引,避免重复
  end
end
