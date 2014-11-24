class AddStockIdToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :stock_id, :integer
  end
end
