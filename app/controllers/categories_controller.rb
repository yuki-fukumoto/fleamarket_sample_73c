class CategoriesController < ApplicationController
  def get_child
    @categories = Category.where(ancestry: params[:ancestry])
    respond_to do |format|
      format.json
    end
  end
end
