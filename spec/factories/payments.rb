FactoryGirl.define do
  factory :payment do
    user
    product
    quantity 1
    amount 12
  end
end
