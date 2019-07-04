class AddBuildingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :building, :string
  end
end
