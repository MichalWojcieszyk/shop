class PaymentsController < ApplicationController
  expose(:payment)
  expose(:product)
  expose(:user)

  def create
    payment = Payment.new(payment_params)
    user = current_user
    product_user = product.user
    payment.user_id = user.id
    payment.amount = product.price * payment.quantity
    if payment.amount > user.cash_amount
      redirect_to products_path, alert: "You don't have enough money to buy this quantity of product"
    elsif payment.quantity > product.on_stock
      redirect_to products_path, alert: "This isn't enough quantity on stock"
    elsif payment.save
      product.payments << payment
      user.cash_amount -= payment.amount
      product_user.cash_amount += payment.amount
      product.on_stock -= payment.quantity
      user.save
      product.save
      product_user.save
      PaymentMailer.payment_created(user, product_user, payment).deliver
      PaymentMailer.bought_product(user, payment).deliver
      redirect_to user_path(current_user), notice: 'Congratulations! You have bought this product'
    else
      render action: 'new'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:quantity, :amount)
  end
end
