class DepositsController < ApplicationController
  expose(:deposit)
  expose(:user)

  def create
    deposit = Deposit.new(deposit_params)
    user = current_user
    if deposit.save
      user.deposits << deposit
      user.cash_amount += deposit.amount
      user.save
      redirect_to user_path(user), notice: "Your deposit is now on your account"
    else
      render action: 'new'
    end
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount)
  end
end
