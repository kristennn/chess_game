class AddUseridToGroupMsgs < ActiveRecord::Migration[5.1]
  def change
    add_column :group_msgs, :userid, :integer
  end
end
