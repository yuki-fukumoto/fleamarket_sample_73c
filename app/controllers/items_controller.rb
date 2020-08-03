class ItemsController < ApplicationController
  before_action :confirm_user_signed_in?, except: [:index, :show]
  before_action :set_item

  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
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

  def edit
    @item = Item.find(params[:id])

    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_update_params)
    redirect_to root_path, notice: '商品を編集しました' 
  end
  

  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end

  # def get_category_children
  #   @category_children = Category.find(params[:category_id]).children
  # end

  # def get_category_grandchildren
  #   @category_grandchildren = Category.find("#{params[:child_id]}").children
  # end
  
  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :shipping_pay, :shipping_area, :shipping_period, :condition, :category_id, :brand_id, :status, images_attributes: [:image,:id]).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name, :explanation, :price, :shipping_pay, :shipping_area, :shipping_period, :condition, :category_id, :brand_id, :status, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
