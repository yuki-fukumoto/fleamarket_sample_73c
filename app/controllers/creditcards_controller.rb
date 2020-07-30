class CreditcardsController < ApplicationController
  include JsHelper
  def new
    @creditcard = Creditcard.new
  end

  def create
    if creditcard = Creditcard.create_card(creditcard_params)
      redirect_to root_path, notice: 'クレジットカードを登録しました'
    else
      respond_to do |format|
        format.json
      end
    end
  end

  private
    def creditcard_params
      params.require(:creditcard).permit(:token).merge(user_id: current_user.id)
    end
end
