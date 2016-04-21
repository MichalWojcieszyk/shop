user1 = User.new(firstname: 'Adam',
                 lastname: 'Adamski',
                 nickname: 'Adamo',
                 email: 'adam@adam.com', 
                 password: 'password',
                 cash_amount: 50000
                )
user1.save
puts user1.inspect

user2 = User.new(firstname: 'Marek',
                 lastname: 'Marecki', 
                 nickname: 'Maro',
                 email: 'marek@marek.com', 
                 password: 'password',
                 cash_amount: 50000
                 )
user2.save
puts user2.inspect

user3 = User.new(firstname: 'Marcin',
                 lastname: 'Marciniak', 
                 nickname: 'Marciak',
                 email: 'marcin@marcin.com', 
                 password: 'password',
                 cash_amount: 50000
                 )
user3.save
puts user3.inspect

user4 = User.new(firstname: 'Darek',
                 lastname: 'Darski', 
                 nickname: 'Daro',
                 email: 'daro@daro.com', 
                 password: 'password',
                 cash_amount: 50000
                 )
user4.save
puts user4.inspect

admin = User.new(firstname: 'Admin',
                 lastname: 'Admin', 
                 admin: true,
                 nickname: 'Admin',
                 email: 'admin@admin.com', 
                 password: 'password',
                 cash_amount: 1000000
                 )
admin.save
puts admin.inspect

users = User.all
5.times do
  category = Category.create(name: "#{Faker::Commerce.department}")
  puts category.inspect
  5.times do		 
    product = Product.create(category: category,
                             user: users.sample,
                             title: "#{Faker::Commerce.product_name}",
                             description: "#{Faker::Lorem.sentences(3).join("<br/>")}",
                             price: rand(1..50000),
                             on_stock: rand(1000..10000)
                             )
    puts product.inspect
    3.times do
      review = Review.create(product: product,
                             user: User.last,
                             content: "#{Faker::Lorem.sentence}",
                             rating: rand(1..5)
                             )
      puts review.inspect
    end
  end
end
