class RemoveNameFromStockTrackers < ActiveRecord::Migration
  def change
    remove_column :stock_trackers, :name, :string
  end
end
