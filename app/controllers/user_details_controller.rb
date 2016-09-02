class UserDetailsController < ApplicationController
  #   before_action :authenticate_user!, only: [:edit, :update]

  # def edit
  #     @user = User.find(current_user)
  #     @user_detail = UserDetail.new
  # end


  # def create
  #     @user_detail = UserDetail.new(user_detail_params)
  #     # @user = User.find(current_user)
  #     if @user_detail.save
  #     binding.pry
  #     redirect_to edit_user_detail_path(@user_detail), notice: 'New profile was successfully created'
  #     else
  #     redirect_to :edit_user_detail, alert: 'New prototype was unsuccessfully created'
  #     end
  # end

  # def update
  #   # if @user_detail.changed
  #     @user = User.find(current_user)
  #     @user_detail = UserDetail.find_by(user_id: @user.id)
  #     @user_detail.update(user_detail_params)
  #     redirect_to :edit_user
  #   # else
  #   #   @user.update(user_params)
  #   # remote ture
  # end

  # private

  # # def set_user
  # #     @user = User.find(current_user)
  # #     @user_detail = UserDetail.find_by(user_id: @user.id)
  # # end


  # def user_detail_params
  #   binding.pry
  #   params.require(:user_detail).permit(:lastname, :firstname, :postalcode, :callnumber, :place, user_attributes: [:id])
  # end


  # def user_params
  #   params.require(:user).permit(:email)
  # end

end
