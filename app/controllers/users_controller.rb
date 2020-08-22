class UsersController < ApplicationController
  def destroy
  end
  def show
    @recently_visit = cookies[:item_name].split(',') if cookies[:item_name]
    @items = Item.search(params[:search]).get_on_sell.order(created_at: :desc).limit(4)
  end
  def change
  end
end
