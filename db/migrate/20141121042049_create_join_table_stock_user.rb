class CreateJoinTableStockUser < ActiveRecord::Migration
  def change
    create_join_table :stocks, :users do |t|
      # t.index [:stock_id, :user_id]
      # t.index [:user_id, :stock_id]
    end
  end
end
