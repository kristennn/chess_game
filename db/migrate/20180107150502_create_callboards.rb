class CreateCallboards < ActiveRecord::Migration[5.1]
  def change
    create_table :callboards do |t|
      t.text :post

      t.timestamps
    end
  end
end
