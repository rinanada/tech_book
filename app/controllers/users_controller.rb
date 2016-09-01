class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
  end

  def index
  end

  def show
  end

  def update
    # if @user_detail.changed
      @user_detail.update(user_detail_params)
      redirect_to :edit_user
    # else
    #   @user.update(user_params)
    # remote ture
  end

  private

  def set_user
    @user = User.find(current_user)
    @user_detail = UserDetail.find_by(user_id: @user.id)
  end


  def user_detail_params
    params.require(:user_detail).permit(:lastname, :firstname, :postalcode, :callnumber, :place)
  end


  def user_params
    params.require(:user).permit(:email)
  end

end



