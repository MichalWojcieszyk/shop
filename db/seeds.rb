user1 = User.new(firstname: "Adam",
                 lastname: "Adamski", 
                 admin: "false",
                 email: "adam@adam.com", 
                 password: "password",
                 cash_amount: 1000
                )
user1.save
puts user1.inspect

user2 = User.new(firstname: "Marek",
                 lastname: "Marecki", 
                 admin: "false",
                 email: "marek@marek.com", 
                 password: "password",
                 cash_amount: 5000
                 )
user2.save
puts user2.inspect

admin = User.new(firstname: "Admin",
                 lastname: "Admin", 
                 admin: "true",
                 email: "admin@admin.com", 
                 password: "password"
                 )
admin.save
puts admin.inspect

5.times do
  category = Category.create(name: "#{Faker::Commerce.department}")
  puts category.inspect
  5.times do		 
    product = Product.create(category: category,
                             user: User.last,
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
