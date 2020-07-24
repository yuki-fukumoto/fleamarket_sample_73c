class ItemsController < ApplicationController
  def index
    @items = Item.includes([:images]).order(created_at: :desc)
  end

  def new
    @item = Item.new
    @images = []
    5.times do |i|
      image = @item.images.build
      @images << image
    end
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
  end

  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end

  private

  def item_params
    binding.pry
    params.require(:item).permit(:name, :explanation, :price, :shipping_pay, :shipping_area, :shipping_period, :condition, :category_id, :brand_id, :status, images_attributes: :image).merge(user_id: current_user.id)
  end
end
