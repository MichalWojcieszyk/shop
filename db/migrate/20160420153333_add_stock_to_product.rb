class AddStockToProduct < ActiveRecord::Migration
  def change
    add_column :products, :on_stock, :integer
  end
end
