class AddCashAmountToUser < ActiveRecord::Migration
  def change
    add_column :users, :cash_amount, :integer
  end
end
