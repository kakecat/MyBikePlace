class Public::SpotsController < ApplicationController
  def index
    @posts = Post.all.to_json.html_safe
  end

  def map
    if params[:posts] == "all_user"
      @posts = Post.all.to_json.html_safe
    elsif params[:posts] == "current_user"
      @posts = current_user.posts.to_json.html_safe
    elsif params[:posts] == "following"
      @posts = current_user.feed.to_json.html_safe
    end
    respond_to do |format|
      format.js { render json: @posts }
    end
  end
end
