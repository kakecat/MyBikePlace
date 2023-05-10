class Public::PostsController < ApplicationController

  def index
  end


# mapsコントローラのmapアクションで、投稿内容を含む変数@postsを定義
# (投稿内容は.to_jsonでjson形式に変換、respond_to doで返す)
  def maps
    if params[:posts] == "all_user"
      @posts = Post.all.to_json.html_safe
    elsif params[:posts] == "current_user"
      @posts = current_user.posts.to_json.html_safe
    elsif params[:posts] == "following"
      @posts = current_user.feed.to_json.html_safe
    end
    respond_to do |format|
      format.js { @posts }
    end
  end
end
