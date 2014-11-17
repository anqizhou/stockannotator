class CreateStockTrackers < ActiveRecord::Migration
  def change
    create_table :stock_trackers do |t|
      t.string :name
      t.string :ticker

      t.timestamps
    end
  end
end
