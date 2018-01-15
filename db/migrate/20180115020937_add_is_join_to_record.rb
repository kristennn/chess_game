class AddIsJoinToRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :group_records, :is_join, :boolean, default: false
  end
end
