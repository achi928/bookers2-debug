class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = @book.id
    @comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:book_comment).permit(:comment)
  end

end

