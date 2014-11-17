class AddDateToStockTrackers < ActiveRecord::Migration
  def change
    add_column :stock_trackers, :date, :date
  end
end
