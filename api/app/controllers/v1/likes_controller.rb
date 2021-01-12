class V1::LikesController < ApplicationController

  def index
    @likes = Like.filter_by_post(params[:post_id]).select(:id, :user_id, :post_id).order("created_at DESC")

    render json: @likes
  end

  def latest
    if params[:offset]
      @likes = Like.includes({user: {avatar_attachment: :blob}}).limit(20).order("created_at DESC").offset(params[:offset])
    else
      @likes = Like.includes({user: {avatar_attachment: :blob}}).limit(20).order("created_at DESC")
    end
    render json: @likes
  end

  def likes
    @likes = Like.where(user_id: params[:id])

    render json: @likes
  end

  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

  private
    def like_params
      params.require(:like).permit(:id,:user_id, :post_id)
    end

end
