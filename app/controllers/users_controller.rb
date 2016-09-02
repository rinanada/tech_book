class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destory]
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    @user = User.new
    2.times { @user.user_details.build }
    # @user_details = UserDetail.new
  end


  def create
    @user = User.new(user_params)
      # @user = User.find(current_user)
      if @user.save
      binding.pry
      redirect_to :edit_user, notice: 'New profile was successfully created'
      else
      redirect_to :edit_user, alert: 'New prototype was unsuccessfully created'
      end
  end

  def destroy
  end

  def update
    if @user.update(user_params)
      redirect_to :edit_user, notice: 'Your profile was successfully updated'
    else
      flash.now[:alert] = 'Your profile was unsuccessfully updated'
    end
  end

  private

  def set_user
      @user = User.find(params[:id])
      # @user_detail = UserDetail.find_by(user_id: @user.id)
  end


  def user_params
    params.require(:user).permit(:id, :email, user_details_attributes: [:lastname, :firstname, :postalcode, :callnumber, :place])
  end


end



