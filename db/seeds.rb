5.times do 
	user = User.new(firstname: "#{Faker::Name.first_name}",
	 				        lastname: "#{Faker::Name.last_name}", 
	 				        admin: "false",
	 				        email: "#{Faker::Internet.email}", 
	 				        password: "#{Faker::Internet.password(10, 12)}", 
	  				     )
	user.save
	
	puts user.inspect
end

1.times do 
	admin = User.new(firstname: "Admin",
	 				         lastname: "Admin", 
	 				         admin: "true",
	 				         email: "admin@admin.com", 
	 				         password: "password", 
	  				      )
	admin.save

	puts admin.inspect
end

5.times do
	category = Category.create(name: "#{Faker::Commerce.department}")
	puts category.inspect
	5.times do		 
		product = Product.create(category: category,
			                       user: User.last,
			                       title: "#{Faker::Commerce.product_name}",
						                 description: "#{Faker::Lorem.sentences(3).join("<br/>")}",
						   		           price: rand(1..50000)
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
