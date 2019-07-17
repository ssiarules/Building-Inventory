class RemoveFloorNumFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :floor_num, :integer
  end
end
