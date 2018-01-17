class AddPhonenumberToTblPlayerinfo < ActiveRecord::Migration[5.1]
  def change
    add_column :tbl_playerinfo, :phonenumber, :integer
    add_index :tbl_playerinfo, :phonenumber, unique: true
  end
end
