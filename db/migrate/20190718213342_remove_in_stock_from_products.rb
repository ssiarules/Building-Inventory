class RemoveInStockFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :in_stock, :string
  end
end
