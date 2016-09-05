class SellingsController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @user = User.find(current_user)
    @book = @user.books.build(book_params)
    if @book.save
      redirect_to root_path, notice: 'new book has been exhibited successfully'
    else
      redirect_to new_selling_path, alert: 'error'
    end
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :sub_title, :price, :state, :description, :content)
  end
end

