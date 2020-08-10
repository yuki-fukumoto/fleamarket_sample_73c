class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:search]).order(created_at: :desc)
    @search = params[:search]
  end

  def detail_search
    @search = params[:search]
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result.page(params[:page])
  end

  private

  def set_ransack
    @q = Item.ransack(params[:q])
  end

end
