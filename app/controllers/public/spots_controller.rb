class Public::SpotsController < ApplicationController
  def index
    @users = User.all
    @spot = Spot.last
    #gon.spots = Spot.all

    spots = Spot.joins(:post).select('spots.id,spots.latitude,spots.longitude,posts.title')
   #   byebug

    if params[:posts] == "all_user"
      spots = Spot.joins(:post).select('spots.id,spots.latitude,spots.longitude,posts.title')
    elsif params[:posts] == "current_user"
      spots = current_user.spots.joins(:post).select('spots.id,spots.latitude,spots.longitude,posts.title')
    elsif params[:posts] == "following"
      spots = Spot.joins(:post).select('spots.id,spots.latitude,spots.longitude,posts.title').where(user_id: current_user.follows.pluck(:id).push(current_user.id))
    end

    gon.spots = spots.map do |spot|
      {
        id: spot.id,
        latitude: spot.latitude,
        longitude: spot.longitude,
        title: spot.title
      }
    end
  end


end