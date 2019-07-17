class RemoveDateFromBuildings < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :date, :date
  end
end
