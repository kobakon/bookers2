class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id]) # パラメータから本を取得
    comment = current_user.book_comments.new(book_comment_params) # ログイン中のユーザーに紐づいた新しいコメントを作成
    comment.book_id = book.id # コメントに本のIDを設定
    comment.save # データベースに保存
    redirect_to request.referer
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
