class Public::PostsController < ApplicationController
 before_action :authenticate_user!, except: [:show]

  def new
    @post = Post.new(latitude: '緯度', longitude: '経度')
  end

   def create
    @post = Post.new(post_params)
    spot = Spot.create!(longitude: params[:post][:longitude], latitude: params[:post][:latitude], user_id: current_user.id)
    @post.spot_id = spot.id
    @post.user_id = current_user.id
  
    if @post.save
      redirect_to public_post_path(@post), notice: '投稿成功しました！'
    else
      redirect_to new_public_post_path, alert: '投稿に失敗しました。もう一度試してください。'
    end
   end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post), notice: '変更が成功しました！'
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to new_public_post_path
  end

  def follow_user
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to public_user_path(@user), notice: 'フォローしました！'
  end

  def unfollow_user
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to public_user_path(@user), notice: 'フォローを解除しました！'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :latitude, :longitude, :post, :spot_image)
  end
end