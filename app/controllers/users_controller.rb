class UsersController < ApplicationController
  def sale_items
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').page(params[:page]).without_count.per(4)
    @sale_items = @items.get_on_sell
  end


  def sold_items
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').page(params[:page]).without_count.per(4)
    @sold_items = @items.where(status: "2")
  end

  def bought_items
    @purchase = Purchase.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).without_count.per(4)
  end

  def show
    @items = Item.where(user_id: current_user.id).includes(:images).order('created_at DESC').limit(4)
    @sale_items = @items.get_on_sell
    @sold_items = @items.where(status: "2")
    
    @history = BrowsingHistory.where(user_id: current_user.id).order('created_at DESC').limit(4)

    @purchase = Purchase.where(user_id: current_user.id).order('created_at DESC').limit(4)
    @bought_items = []
    @purchase.each do |purchase|
      @bought_items << purchase.item
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:sign_up, keys: [:nickname, :firstname, :lastname, :firstname_read, :lastname_read, :birthday, address_attributes: [:firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, :building, :room, :telephone]])
  end
end