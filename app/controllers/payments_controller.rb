class PaymentsController < ApplicationController
  expose(:payment)
  #expose(:payments)
  expose(:product)

  def create
    payment = Payment.new(payment_params)
    payment.user_id = current_user.id
    payment.amount = product.price * payment.quantity
    if payment.save
      product.payments << payment
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
