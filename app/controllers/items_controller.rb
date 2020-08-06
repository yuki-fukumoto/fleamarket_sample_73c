class ItemsController < ApplicationController
  before_action :confirm_user_signed_in?, except: [:index, :show]

  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
    @items = Item.includes([:images]).order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @item = Item.new
    @images = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end

  
  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :shipping_pay, :shipping_area, :shipping_period, :condition, :category_id, :brand_id, :status, images_attributes: [:image]).merge(user_id: current_user.id)
  end

end
