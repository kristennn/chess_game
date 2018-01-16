class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.integer :userid
      t.integer :friend_id

      t.timestamps
    end
  end
end
