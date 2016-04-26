class PaymentMailer < ActionMailer::Base
  def payment_created(current_user, product_user, payment)
    @current_user = current_user
    @product_user = product_user
    @payment = payment

    mail(to: @product_user.email,
         from: 'shopapp@gmail.com',
         subject: "#{@current_user.email} has bought your product!"
         )
  end

  def bought_product(current_user, payment)
    @current_user = current_user
    @payment = payment

    mail(to: @current_user.email,
         from: 'shopapp@gmail.com',
         subject: "Congratulations! You have bought #{payment.product.title}."
         )
  end
end
