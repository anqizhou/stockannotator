class AddPriceToStockTrackers < ActiveRecord::Migration
  def change
    add_column :stock_trackers, :price, :float
  end
end
