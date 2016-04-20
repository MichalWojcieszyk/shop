class AddProductToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :product, index: true
    add_foreign_key :payments, :products
  end
end
