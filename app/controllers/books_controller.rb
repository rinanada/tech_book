class BooksController < ApplicationController

  def index
    if user_signed_in?
      @user_detail = UserDetail.find_by(user_id: current_user.id)
      @mastname = @user_detail.try(:lastname) || ''
      @mastname += @user_detail.try(:firstname) || '名無し'
      @mastname += 'さん'
    else
      @mastname  = 'ログイン/新規登録'
    end
    @books = Book.includes(:e_user).page(params[:page]).per(4)
    @categories = ActsAsTaggableOn::Tag.most_used(7)
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.e_books.build(book_params)
    if @book.save
      @book.update(sold?: "n")
      redirect_to root_path, notice: 'new book has been exhibited successfully'
    else
      redirect_to new_book_path, alert: 'error'
    end
  end

  def show
    @book = Book.find(params[:id])
    @user_detail = UserDetail.find_by(id: @book.user_detail.id)
    @related_books = Book.tagged_with(@book.category_list, any: true).uniq.where.not(id: @book.id)
    # max 3s冊まで
  end

  private

  def book_params
    params.require(:book).permit(:title, :sub_title, :price, :state, :description, :content, :category_list).merge(e_user_id: current_user.id, user_detail_id: current_user.user_detail.id)
  end
end
