class V1::RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user = User.find_by(id: params[:follower_id])
    @relationship = current_user.follow!(@user)
    render json: @relationship, status: :created
  end

  def destroy
    @user = User.find(params[:following_id])
    current_user = User.find_by(id: params[:follower_id])
    current_user.unfollow!(@user)
  end

end
