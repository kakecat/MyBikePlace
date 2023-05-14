class Public::SpotsController < ApplicationController
  def index
    @users = User.all
    #gon.spots = Spot.all

    spots = Spot.joins(:post).select('spots.id,spots.latitude,spots.longitude,posts.title')

    gon.spots = spots.map do |spot|
      {
        id: spot.id,
        latitude: spot.latitude,
        longitude: spot.longitude,
        title: spot.title
      }
    end
   #   byebug

    if params[:posts] == "all_user"
      gon.posts = Post.all
    elsif params[:posts] == "current_user"
      gon.posts = current_user.posts
    elsif params[:posts] == "following"
      gon.posts = current_user.follows
    end

  end

  # def map
  #   # gon.posts = Post.all
  #   if params[:posts] == "all_user"
  #     gon.posts = Post.all
  #   elsif params[:posts] == "current_user"
  #     gon.posts = current_user.posts
  #   elsif params[:posts] == "following"
  #     gon.posts = current_user.feed
  #   end
  #   respond_to do |format|
  #     format.js
  #   end
  # end
end