class PaymentsController < ApplicationController
  expose(:payment)
  expose(:product)

  def create
    payment = Payment.new(payment_params)
    user = current_user
    payment.user_id = user.id
    payment.amount = product.price * payment.quantity
    if payment.save
      product.payments << payment
      user.cash_amount -= payment.amount
      product.on_stock -= payment.quantity
      user.save
      product.save
      redirect_to user_path(current_user), notice: 'Congratulations! You bought this product'
    else
      render action: 'new'
    end
  end

  def show

  end

  def index

  end

  def destroy

  end

  private

  def payment_params
    params.require(:payment).permit(:quantity)
  end
end
