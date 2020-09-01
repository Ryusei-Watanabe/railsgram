class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end
  def show
    @post = current_user.favorites.find(params[:id]).post
    redirect_to post_path(@post.id)
  end
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "#{favorite.post.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_url, notice: "#{favorite.post.user.name}さんのブログをお気に入り解除しました"
  end
end
