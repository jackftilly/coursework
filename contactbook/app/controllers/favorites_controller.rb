class FavoritesController < ApplicationController

  def index
    render json: Favorite.all
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      render json: @favorite
    else
      render json: @favorite.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
    render json: @favorite
  end

  def update
    @favorite = Favorite.find_by(id: params[:id])
    if @favorite.update(favorite_params)
      render json: @favorite
    else
      render json: @favorite.errors.full_messages
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    if @favorite.destroy
      render json: @favorite
    else
      render json: @favorite.errors.full_messages
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:contact_id, :user_id)
  end
end
