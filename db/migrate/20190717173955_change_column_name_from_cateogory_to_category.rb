class ChangeColumnNameFromCateogoryToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :cateogory, :category
  end
end
