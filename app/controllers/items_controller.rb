class ItemsController < ApplicationController
  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
  end
end
