class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :cateogory
      t.integer :floor_num
      t.integer :in_stock
      t.text :description
      t.datetime :date_added
      t.belongs_to :user, foreign_key: true
      t.belongs_to :floor, foreign_key: true

      t.timestamps
    end
  end
end
