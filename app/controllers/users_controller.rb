class UsersController < ApplicationController
  def sale_items
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').page(params[:page]).without_count.per(4)
    @sale_items = @items.get_on_sell
  end
  
  def destroy
  end

  def show
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').limit(4)
    @sale_items = @items.get_on_sell
  end

  def change
  end
end
