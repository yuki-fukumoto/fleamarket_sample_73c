class ItemsController < ApplicationController
  before_action :confirm_user_signed_in?, except: [:index, :show]

  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
    @items = Item.includes([:images]).order(created_at: :desc).page(params[:page]).per(5)
    @random = Item.order("RAND()").limit(4)
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
    @item.update(item_params)
    redirect_to root_path, notice: '商品を編集しました' 
  end
  

  def collection_child_categories
    @categories = Category.get_categories(params[:selected_id])
    render json: @categories
  end


  def search
    @items = Item.search(params[:keyword]).order(created_at: :desc)
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :shipping_pay, :shipping_area, :shipping_period, :condition, :category_id, :brand_id, :status, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
