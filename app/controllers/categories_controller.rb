class CategoriesController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(1)
  end
end
