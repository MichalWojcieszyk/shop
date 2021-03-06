class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :product
      t.integer :quantity
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
