class UsersController < ApplicationController
  def destroy
  end
  def show
    @categories = Category.all
  end
  def change
  end
end
