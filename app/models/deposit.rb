class Deposit < ActiveRecord::Base
  belongs_to :user

  validates :amount, presence: true
end
