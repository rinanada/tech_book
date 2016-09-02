class UsersController < ApplicationController
  # before_action :set_user, only: [:update, :destory]
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    @user = User.find(current_user)
    @user_details = UserDetail.find_by(user_id: @user.id)
    unless @user_detail.present?
      @user_details = UserDetail.new
      binding.pry
    end
  end


  # def create
  #   @user = User.new(user_details_params)
  #     if @user.save
  #     redirect_to :edit_user, notice: 'New profile was successfully created'
  #     else
  #     redirect_to :edit_user, alert: 'New prototype was unsuccessfully created'
  #     end
  # end

  def destroy
  end

  def update

    @user = User.find(params[:id])
    if @user.update(user_details_params)
      redirect_to :edit_user, notice: 'Your profile was successfully updated'
    else
      flash.now[:alert] = 'Your profile was unsuccessfully updated'
    end
  end

  private


  def user_details_params
    params.require(:user).permit(:id, user_details_attributes: [:lastname, :firstname, :postalcode, :callnumber, :place])
    binding.pry
  end

end



