class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:search]).get_on_sell.order(created_at: :desc)
    @search = params[:search]
  end

  def detail_search
    @sorts = params[:q][:sorts]
    if params[:q][:category_id_eq].present?
      @grandchild = Category.find(params[:q][:category_id_eq])
      @child = @grandchild.parent
      @parent = @child.parent
    end
    
    @items = @q.result.page(params[:page]).get_on_sell 
  end

  private

  def set_ransack
    @q = Item.ransack(params[:q])
  end

end
