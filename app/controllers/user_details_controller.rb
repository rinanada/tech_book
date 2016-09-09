class UserDetailsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def new
    @user_detail = UserDetail.new
  end

  def create
    @user_detail = current_user.user_details.build(user_details_params)
    if @user_detail.save
      redirect_to root_path, notice: 'Your profile was successfully created'
    else
      flash.now[:alert] = 'Your profile was unsuccessfully created'
    end
  end

  def edit
    @user_detail = UserDetail.find_by(user_id: current_user.id)
    @user_details = UserDetail.where(user_id: current_user.id)
    @order_books = Book.where(o_user_id: current_user.id)
  end


  def destroy
  end

  def update
    @user_detail = UserDetail.find_by(user_id: current_user.id)
    if @user.update(user_details_params)
      redirect_to :edit_user, notice: 'Your profile was successfully updated'
    else
      flash.now[:alert] = 'Your profile was unsuccessfully updated'
    end
  end

  private


  def user_details_params
    params.require(:user_detail).permit(:lastname, :firstname, :postalcode, :callnumber, :place)
  end

  def user_params
    params.require(:user).permit(:pro_img)
  end

end
