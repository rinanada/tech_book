class BooksController < ApplicationController
  def index
    if user_signed_in?
      @user = User.find(current_user)
      @user_detail = UserDetail.find_by(user_id: @user.id)
      @mastname = @user_detail.try(:lastname) || ''
      @mastname += @user_detail.try(:firstname) || '名無し'
      @mastname += 'さん'
    else
      @mastname  = 'ログイン/新規登録'
      binding.pry
    end
    @books = Book.find(1)
  end



  def show
    @book = Book.find(params[:id])
  end

end
