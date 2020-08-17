class ItemsController < ApplicationController
  before_action :confirm_user_signed_in?, except: [:index, :show, :search]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.get_on_sell.includes([:images]).order(created_at: :desc).page(params[:page]).per(5)
    @random = Item.order("RAND()").get_on_sell.limit(4)
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
    redirect_to_root_if_item_is_sold(@item)
    @sub1_category = @item.category.parent
    @main_category = @sub1_category.parent
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
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
    @item.update(item_params)
    redirect_to root_path, notice: '商品を編集しました'
  end

  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :shipping_pay, :shipping_area, :shipping_period, :condition, :category_id, :brand_id, :status, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
