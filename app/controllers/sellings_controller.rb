class SellingsController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = current_user.e_books.build(book_params)
    if @book.save
      @book.update(sold?: "n")
      redirect_to root_path, notice: 'new book has been exhibited successfully'
    else
      redirect_to new_selling_path, alert: 'error'
    end
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :sub_title, :price, :state, :description, :content).merge(e_user_id: current_user.id)
  end
end

