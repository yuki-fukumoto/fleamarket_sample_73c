class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:search]).order(created_at: :desc)
    @search = params[:search]
  end

  def detail_search
    # @category = Category.find(params[:category_id_eq])
    @search = params[:search]
    @search_item = Item.ransack(params[:q]) 
    @sorts = params[:q][:sorts]
    if params[:q][:category_id_eq].present?
      @grandchild = Category.find(params[:q][:category_id_eq])
      @child = @grandchild.parent
      @parent = @child.parent
    end

    # @category_id_eq = params[:q][:category_id_eq]
    
    @condition_in = params[:q][:condition_in]
    @items = @search_item.result.page(params[:page])
  end

  private

  def set_ransack
    @q = Item.ransack(params[:q])
  end

end
