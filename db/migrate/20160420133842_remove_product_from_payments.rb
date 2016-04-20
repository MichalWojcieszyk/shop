class RemoveProductFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :product
  end
end
