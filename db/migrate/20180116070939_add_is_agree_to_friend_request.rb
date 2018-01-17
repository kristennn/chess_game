class AddIsAgreeToFriendRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :friend_requests, :is_agree, :boolean, default: false
  end
end
