class UsersController < ApplicationController
  def sale_items
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').page(params[:page]).without_count.per(4)
    @sale_items = @items.get_on_sell
  end
  
  def destroy
  end
  def show
    @recently_visit = cookies[:item_name].split(',') if cookies[:item_name]
    @items = Item.search(params[:search]).get_on_sell.order(created_at: :desc).limit(4)
  end
  def change
  end
end
