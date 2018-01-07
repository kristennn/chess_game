class AddTitleToCallboard < ActiveRecord::Migration[5.1]
  def change
    add_column :callboards, :title, :string
  end
end
