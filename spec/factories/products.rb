FactoryGirl.define do
  factory :product do 
    title 'Table'
    description 'Big one'
    price 10
    user
    category
    on_stock 1000
  end	
end