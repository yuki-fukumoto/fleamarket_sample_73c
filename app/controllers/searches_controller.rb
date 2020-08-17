class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:search]).get_on_sell.order(created_at: :desc)
    @search = params[:search]
  end

  def detail_search
    @search = params[:search]
    @search_item = Item.ransack(params[:q])
    @sorts = params[:q][:sorts]
    if params[:q][:category_id_eq].present?
      @grandchild = Category.find(params[:q][:category_id_eq])
      @child = @grandchild.parent
      @parent = @child.parent
    end
    
    @condition_in = params[:q][:condition_in]
    @items = @search_item.result.page(params[:page]).get_on_sell 
  end

  private

  def set_ransack
    @q = Item.ransack(params[:q])
  end

end
