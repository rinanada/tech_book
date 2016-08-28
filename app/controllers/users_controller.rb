class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @address = Address.includes(:user)
    # @address.new
  end
end
