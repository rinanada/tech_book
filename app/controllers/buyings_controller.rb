class BuyingsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:update, :show]

  def new
    @user = User.find(current_user)
    @user_detail = UserDetail.find_by(user_id: @user.id)
  end



  def show
  end

  def user_detail_params
    params.require(:user_detail).permit(:lastname, :firstname, :postalcode, :place, :email, :callnumber)
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
