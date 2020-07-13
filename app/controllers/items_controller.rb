class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
    # @item = Item.new
  end

  def create
    # Item.create(item_params)
    # redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
  end
end
