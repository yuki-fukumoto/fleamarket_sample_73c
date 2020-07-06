class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @brands = Brand.all
    @categories = Category.get_categories(nil)
  end

  def create
    binding.pry
    # useridを付与するために再度ブランチを切り直して移植する

    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      flash.now[:notice] = @item.errors.full_messages
      render :new
    end
  end

  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end

  private

  def item_params
    # ログイン機能未実装のためuser_id = 0としてmerge。ログイン機能実装後、current_user.idに置き換えること
    params.require(:item).permit(:name, :explanation, :price, :shipping_fee, :condition, :category_id, :brand_id).merge(user_id: 83)
  end
end
