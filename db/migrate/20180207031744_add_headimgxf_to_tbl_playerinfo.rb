class AddHeadimgxfToTblPlayerinfo < ActiveRecord::Migration[5.1]
  def change
    add_column :tbl_playerinfo, :headimgxf, :string
  end
end
