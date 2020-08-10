class UsersController < ApplicationController
  def destroy
  end
  def show
    @user = User.find(current_user.id)
  end

  def change
  end
end
