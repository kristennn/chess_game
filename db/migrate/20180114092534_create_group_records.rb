class CreateGroupRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :group_records do |t|
      t.integer :group_msg_id
      t.integer :userid

      t.timestamps
    end
  end
end
