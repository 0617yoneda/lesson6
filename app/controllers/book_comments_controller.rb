class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @book.book_comments.count
    @comments = @book.book_comments
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = BookComment.find_by(book_id: params[:book_id], id: params[:id]).destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end