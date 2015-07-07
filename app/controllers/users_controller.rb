class UsersController < ApplicationController
  expose(:user)
  expose(:reviews, ancestor: :user)
  
  def show
  end

  private

  def review_params
    params.require(:user).permit(:firstname, :lastname, :email)
  end
end