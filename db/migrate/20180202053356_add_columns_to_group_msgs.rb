class AddColumnsToGroupMsgs < ActiveRecord::Migration[5.1]
  def change
    add_column :group_msgs, :pics2, :string
    add_column :group_msgs, :pics3, :string
  end
end
