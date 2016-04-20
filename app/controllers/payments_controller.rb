class PaymentsController < ApplicationController
  expose(:payment)
  expose(:payments)

  def create

  end

  def show

  end

  def index

  end

  def destroy

  end

  private

  def payment_params
    params.require(:payment).permit(:product, :quantity, :amount, :category_id, :user_id)
  end
end
