class CreateFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :floors do |t|
      t.string :name
      t.integer :floor_num
      t.belongs_to :building, foreign_key: true

      t.timestamps
    end
  end
end
