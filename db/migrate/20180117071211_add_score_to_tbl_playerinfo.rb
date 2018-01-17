class AddScoreToTblPlayerinfo < ActiveRecord::Migration[5.1]
  def change
    add_column :tbl_playerinfo, :score, :integer, default: 0
  end
end
