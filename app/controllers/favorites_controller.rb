class FavoritesController < ApplicationController
  before_action :set_product, only: [:create, :destoroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(
      user_id: current_user.id,
      item_id: @item.id
    )
    @favorite.save
  end

  def destoroy
    @favorite = Favorite.find_by(
      user_id: current_user.id,
      item_id: @item.id
    )
    @favorite.destoroy
  end

  private

  def set_item
    @item = item.find(params[:item_id])
  end
end

