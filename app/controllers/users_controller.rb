class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def change
    create_table :adresses do |t|
      t.references :adresses, index: true, foreign_key: true,
    create_table :creditcards do |t|
      t.references :creditcards, index: true, foreign_key: true,
  

    end
  end
end
