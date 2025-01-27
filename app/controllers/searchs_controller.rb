class SearchsController < ApplicationController
  def search
    if params[:model] == "Book" 
      if params[:match] == "0"
        @search_books = Book.where("title = :query OR body = :query", query: params[:query])
      elsif params[:match] == "1"
        @search_books = Book.where("title LIKE :query OR body LIKE :query", query: "%#{params[:query]}%")
    elsif params[:model] == "User" 
      if params[:match] == "0"
        @search_users = User.where("name = :query OR introduction = :query", query: params[:query])
      elsif params[:match] == "1"
        @search_users = User.where("name LIKE :query OR introduction LIKE :query", query: "%#{params[:query]}%")
      end
    end
    @model = params[:model]
  end
  end
end
