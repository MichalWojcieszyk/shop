require 'rails_helper'

RSpec.describe CategoriesController do
  let (:user) { create :user }

  #before { sign_in user }

  before do 
  	sign_in user
  	controller.stub(:user_signed_in?).and_return(true)
  	controller.stub(:current_user).and_return(user)
  	controller.stub(:authenticate_user!).and_return(user)
  end
end
  #describe 'GET show' 