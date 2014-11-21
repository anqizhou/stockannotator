class DropStockTrackers < ActiveRecord::Migration
  def change
    drop_table :stock_trackers
  end
end
