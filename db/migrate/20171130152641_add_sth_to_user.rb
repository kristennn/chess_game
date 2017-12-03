class AddSthToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :permission, :string
  end
end
