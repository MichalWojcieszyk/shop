FactoryGirl.define do
  factory :product do 
    title 'Table'
    description 'Big one'
    price 10
    user
    category
  end	
end