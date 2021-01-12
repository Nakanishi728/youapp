class V1::RelationshipsController < ApplicationController

  def follower
      @relationship = Relationship.where(follower_id: params[:follower_id], following_id: params[:following_id])
      render json: @relationship
  end

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
