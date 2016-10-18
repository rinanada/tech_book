class OrdersController < ApplicationController
    before_action :set_user, only: [:new, :create]
    before_action :authenticate_user!, only: [:new ,:create]

  def new
    @book = Book.find(params[:book_id])
    @tax = (@book.price + 200) * 0.08
    @total_price = (@book.price + 200) * 1.08
  end

  def create
    @order = @user.orders.create
    @order = @book.orders.create
    @book.update(sold?: "y", o_user_id: @user.id)
  end

  private
  def user_detail_params
    params.require(:user_detail).permit(:lastname, :firstname, :postalcode, :place, :email, :callnumber)
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def set_user
    @user = User.find(current_user)
    @book = Book.find(params[:book_id])
    @user_detail = UserDetail.find_by(user_id: current_user.id)
  end
end
