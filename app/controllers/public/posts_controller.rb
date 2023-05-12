class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new(latitude: '緯度', longitude: '経度')
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def post_params
      params.require(:post).permit(:title, :content, :latitude, :longitude)
  end
end
