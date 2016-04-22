class ChangeDefaultValueForCashAmount < ActiveRecord::Migration
  def change
    change_column :users, :cash_amount, :decimal, precision: 10, scale: 2, default: 0
  end
end
