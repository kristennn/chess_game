class CreateQuitRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :quit_records do |t|
      t.integer :userid

      t.timestamps
    end
  end
end
