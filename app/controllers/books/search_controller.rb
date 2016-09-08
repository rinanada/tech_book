class Books::SearchController < ApplicationController
  before_action :books_search

 def database
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
    if params[:sold] == "y"
      @books = @books.where(o_user_id: nil)
    end
  end
end
