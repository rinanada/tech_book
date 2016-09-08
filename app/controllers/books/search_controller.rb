class Books::SearchController < ApplicationController
 def database
    books_search
    @searcher = { category: params[:category], keyword: params[:keyword] }
    @categories = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
  end

  private
  def books_search
    if params[:category].present?
      if params[:keyword].present?
        @books = Book.tagged_with(params[:category]).where("title LIKE %#{params[:keyword]}%", "%#{params[:keyword]}%").includes(:o_user)
      else
        @books = Book.tagged_with(params[:category]).includes(:o_user)
      end
    else
      @books = Book.where("title LIKE ?", "%#{params[:keyword]}").includes(:o_user)
    end
    if params[:reject_sold] == "yes"
      @books = @books.where(o_user_id: nil)
    end
  end
end
