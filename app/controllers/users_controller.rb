class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authorization
  
  expose(:user)
  expose(:reviews, ancestor: :user)
  expose(:payments)
  expose(:product)
  expose(:deposit)
  expose(:deposits)

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text 'Imie: ' + "#{user.firstname}" + ' Nazwisko: ' + "#{user.lastname}" + ' Email: ' +  "#{user.email}"
        send_data pdf.render, filename: "#{user.email}.pdf", type: 'application/pdf'
      end
    end
  end

  def edit
  end

  def update
  	if user.update(user_params)
  		redirect_to user
  	else
  		Rails.logger.info(user.errors.messages.inspect)
  		flash.now[:alert] = 'Something went wrong'
  		render action: 'edit'
  	end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :cash_amount, :avatar, :nickname)
  end

  def check_authorization
  	unless current_user.id == params[:id].to_i
  		redirect_to root_path
  	end
  end
end
