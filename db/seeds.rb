require 'faker'
include Faker

5.times do 
	user = User.new(:firstname => "#{Name.first_name}",
	 				   :lastname => "#{Name.last_name}", 
	 				   :admin => "false",
	 				   :email => "#{Internet.email}", 
	 				   :password => "#{Internet.password(10, 12)}", 
	  				   )
	user.save
	
	puts user.inspect
end

1.times do 
	admin = User.new(:firstname => "#{Name.first_name}",
	 				   :lastname => "#{Name.last_name}", 
	 				   :admin => "true",
	 				   :email => "#{Internet.email}", 
	 				   :password => "#{Internet.password(10, 12)}", 
	  				   )
	admin.save

	puts admin.inspect
end

1.times do
	category = Category.create(:name => "#{Commerce.department}"
							  )
	puts category.inspect
	5.times do		 
		product = Product.create(:category => category,
			                     :user => User.last,
			                     :title => "#{Commerce.product_name}",
						         :description => Lorem.sentences(3).join("<br/>").html_safe,
						   		 :price => rand(1..50000)
						   		)
	    puts product.inspect
		5.times do
			review = Review.create(:product => product,
				                   :user => User.last,
				                   :content => Lorem.sentence.html_safe,
								   :rating => rand(1..5)
							      )
			puts review.inspect
		end
	end

end
