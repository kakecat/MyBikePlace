class Public::FavoritesController < ApplicationController
  def create
    if user_signed_in?
      post = Post.find(params[:post_id])
      favorite = current_user.favorites.new(post_id: post.id)
      favorite.save
      redirect_to public_post_path(post), notice: "いいねしました"
    else
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to public_post_path(post)
  end
end
