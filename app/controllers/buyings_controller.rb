class BuyingsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:update, :show]

  def new
    # binding.pry
    @user = User.find(current_user)
    @user_detail = UserDetail.find_by(user_id: @user.id)
    # @address = Address.find(current_user)
  end

  # def create
  #   @user = Prototype.new(user_params)
  #   if @user.save
  #     redirect_to :buying
  #   else
  #     redirect_to ({ action: :new })
  #    end
  # end

  # def update
  #   # binding.pry
  #   @user = User.find(current_user)
  #   @user.update(user_params)
  #   redirect_to :new_buying
  #   # binding.pry

  # end



  def show
  end

  def user_detail_params
    params.require(:user_detail).permit(:lastname, :firstname, :postalcode, :place, :email, :callnumber)
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
