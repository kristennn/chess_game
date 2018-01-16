class AddIndexToFriendRequest < ActiveRecord::Migration[5.1]
  def change
    add_index :friend_requests, :userid
    add_index :friend_requests, :friend_id
    add_index :friend_requests, [:userid, :friend_id], unique: true
  end
end
