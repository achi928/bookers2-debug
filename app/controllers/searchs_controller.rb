class SearchsController < ApplicationController
  def search
    if params[:model] == "Book" 
      if params[:match] == "0"
        @search = Book.where("title = :query OR body = :query", query: params[:query])
      elsif params[:match] == "1"
        @search = Book.where("title LIKE :query OR body LIKE :query", query: "%#{params[:query]}%")
      end
    elsif params[:model] == "User" 
      if params[:match] == "0"
        query = p(params[:query]) 
        @search = User.where("name = :query OR introduction = :query", query: params[:query])
      elsif params[:match] == "1"
        @search = User.where("name LIKE :query OR introduction LIKE :query", query: "%#{params[:query]}%")
      end
    end
    @model = params[:model]
  end
end
