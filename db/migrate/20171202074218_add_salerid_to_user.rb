class AddSaleridToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :salerid, :integer
  end
end
