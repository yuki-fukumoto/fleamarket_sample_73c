class CreditcardsController < ApplicationController

  def new
    @creditcard = Creditcard.new
  end

  def create
    binding.pry
    if creditcard = Creditcard.create_card(creditcard_params)
      redirect_to root_path, notice: 'クレジットカードを登録しました'
    else
      render :new
    end
  end

  def edit
  end

  private
    def creditcard_params
      params.require(:creditcard).permit(:card_id).merge(user_id: current_user.id)
    end
end
