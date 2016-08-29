class BuyingsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:update]

  def new
    @user = User.find(current_user)
    # @exhibit = Exhibit.find(params[:id])

  end

  def update
    @user = User.find(current_user)
    @user.update(user_params)
    redirect_to :buying_path
    # remote true
  end

  def create
  end

  def show
  end

  def user_params
    params.require(:user).permit(:lastname, :firstname, :postalcode, :place, :email, :callnumber)
  end
end
