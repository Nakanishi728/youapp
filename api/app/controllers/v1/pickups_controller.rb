class V1::PickupsController < ApplicationController
  def index
    @pickups = Pickup.where(user_id: params[:id]).limit(3).order('created_at DESC')

    render json: @pickups
  end

  def create
    @pickup = Pickup.new(post_id: params[:id], user_id: params[:user_id])

    if @pickup.save
      render json: @pickup, status: :created
    else
      render json: @pickup.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pickup = Pickup.find(params[:id])
    @pickup.destroy
  end

  private

  def pickup_params
    params.require(:pickup).permit(:id, :post_id, :user_id)
  end
end
