class ProductMailer < ActionMailer::Base
  def product_created(user, product)
    @user = user
    @product = product

    mail(to: @user.email,
         from: 'shopapp@gmail.com',
         subject: 'You added new product'
         )
  end
end
