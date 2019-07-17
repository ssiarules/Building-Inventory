class RemoveFloorNumAndUserIdFromBuildings < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :floor_num, :integer
    remove_column :buildings, :user_id, :integer
  end
end
