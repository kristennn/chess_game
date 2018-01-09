class CreateMarquees < ActiveRecord::Migration[5.1]
  def change
    create_table :marquees do |t|
      t.text :post

      t.timestamps
    end
  end
end
