class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id) # ログイン中のユーザーに紐づいたいいねを作成
    favorite.save  # データベースに保存
    
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)  # ログイン中のユーザーに紐づいたお気に入りを特定
    favorite.destroy # お気に入りを削除
    
  end
end
