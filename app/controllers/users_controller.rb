class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
  end

  def index
  end

  def show
  end

  def update
    @user.update(user_params)
    binding.pry
    redirect_to :edit_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:lastname, :firstname, :postalcode, :place, :email)
  end
end



