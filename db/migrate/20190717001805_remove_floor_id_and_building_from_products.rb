class RemoveFloorIdAndBuildingFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :floor_id, :integer
    remove_column :products, :building, :string
  end
end
