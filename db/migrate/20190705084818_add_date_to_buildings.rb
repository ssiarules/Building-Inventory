class AddDateToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :date, :date
  end
end
