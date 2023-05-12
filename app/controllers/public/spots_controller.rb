class Public::SpotsController < ApplicationController
  def index
    @posts = Post.all
  end

  def map
    if params[:posts] == "all_user"
      @posts = Post.all
    elsif params[:posts] == "current_user"
      @posts = current_user.posts
    elsif params[:posts] == "following"
      @posts = current_user.feed
    end
    respond_to do |format|
      format.js
    end
  end
end