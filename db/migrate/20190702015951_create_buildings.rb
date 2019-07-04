class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :floor_num
      t.integer :user_id 

      t.timestamps
    end
  end
end
