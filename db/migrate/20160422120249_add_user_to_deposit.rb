class AddUserToDeposit < ActiveRecord::Migration
  def change
    add_reference :deposits, :user, index: true
    add_foreign_key :deposits, :users
  end
end
