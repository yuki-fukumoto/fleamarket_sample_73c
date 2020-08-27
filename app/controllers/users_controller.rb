class UsersController < ApplicationController
  def sale_items
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').page(params[:page]).without_count.per(4)
    @sale_items = @items.get_on_sell
  end

  def sold_items
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').page(params[:page]).without_count.per(4)
    @sold_items = @items.where(status: "2")
  end

  def buy_items
    @buyer = Purchase.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).without_count.per(4)
  end

  def show
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').limit(4)
    @sale_items = @items.get_on_sell
    @sold_items = @items.where(status: "2")
    
    @history = BrowsingHistory.where(user_id: current_user.id).order('created_at DESC').limit(4)

    @buyer = Purchase.where(user_id: current_user.id).order('created_at DESC').limit(4)
    @buy_items = []
    @buyer.each do |buyer|
      @buy_items << buyer.item
    end

  end
end
