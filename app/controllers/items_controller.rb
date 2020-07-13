class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      # flash.now[:notice] = @item.errors.full_messages
      render :new
    end
  end

  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end

  private

  def item_params
    # ログイン機能未実装のためuser_id = 固定値としてmerge。ログイン機能実装後、current_user.idに置き換えること
    params.require(:item).permit(:name, :explanation, :price, :shipping_pay, :shipping_area, :shipping_period, :condition, :category_id, :brand_id, :status, image: []).merge(user_id: 83)
  end
end
