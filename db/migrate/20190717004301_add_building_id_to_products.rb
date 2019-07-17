class AddBuildingIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :building, foreign_key: true
    add_foreign_key :products, :buildings
  end
end
