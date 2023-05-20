class Public::FollowsController < ApplicationController
  def create
    user = User.find(params[:user_id]) # フォロー対象のユーザーを取得
    logger.debug "user_id: #{params[:user_id]}" # パラメータの値をログに出力
    current_user.follow(user.id) # ログインユーザーがフォローする
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.follwers
  end
end
