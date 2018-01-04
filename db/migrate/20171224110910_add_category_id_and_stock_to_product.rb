class AddCategoryIdAndStockToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :stock, :integer
    add_column :products, :category_id, :integer
  end
end
