class CreateGroupMsgs < ActiveRecord::Migration[5.1]
  def change
    create_table :group_msgs do |t|
      t.string :discription
      t.string :name
      t.integer :count
      t.string :pics

      t.timestamps
    end
  end
end
