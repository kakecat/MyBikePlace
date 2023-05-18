class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_users_my_page_path, notice: "変更が成功しました。"
    else
      render :edit
    end
  end

  def check
    @user = current_user
  end

  def withdraw
    @user = current_user
    # is_activeカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_active: false)
     # 関連するデータを削除
    @user.posts.destroy_all
    @user.comments.destroy_all
    @user.favorites.destroy_all
    # ユーザー自体を削除
    @user.destroy
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:account_name, :email, :password, :user_info, :profile_image)
  end
end
