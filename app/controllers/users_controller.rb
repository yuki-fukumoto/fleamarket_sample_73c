class UsersController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').page(params[:page]).without_count.per(4)
    @sale_items = @items.get_on_sell
    # @sale_items = Item.search(params[:search]).get_on_sell.order(created_at: :desc)
  end
  
  def destroy
  end
  def show
  end
  def change
  end
end
