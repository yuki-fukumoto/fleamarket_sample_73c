class ItemsController < ApplicationController
  before_action :confirm_user_signed_in?, except: [:index, :show, :search]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.get_on_sell.includes([:images]).order(created_at: :desc).page(params[:page]).without_count.per(4)
    @random = Item.order("RAND()").get_on_sell.limit(4)
    @categories = Category.all
  end

  def new
    @item = Item.new
    @item.images.new
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
    @sub1_category = @item.category.parent
    @main_category = @sub1_category.parent
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order(created_at: :desc)
    
    if user_signed_in?
      new_history = @item.browsing_histories.new
      new_history.user_id = current_user.id

      if current_user.browsing_histories.exists?(item_id: "#{params[:id]}")
        old_history = current_user.browsing_histories.find_by(item_id: "#{params[:id]}")
        old_history.destroy
      end

      new_history.save

      histories_stock_limit = 20
      histories = current_user.browsing_histories.all
      if histories.count > histories_stock_limit
        histories[0].destroy
      end
    end
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

