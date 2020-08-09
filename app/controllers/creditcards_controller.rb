class CreditcardsController < ApplicationController
  include PayjpHelper

  def new
    @creditcard = Creditcard.new
  end

  def create
    if creditcard = Creditcard.create_card(creditcard_params)
      redirect_to root_path, notice: 'クレジットカードを登録しました'
    else
      # API通信時にエラーが発生していた場合の処理
      if params[:creditcard][:error].presence
        set_token_error_in_flash(params[:creditcard][:error])
        render :new
      # クレジットカードの登録
      elsif creditcard = Creditcard.create_card(creditcard_params)
        redirect_to root_path, notice: 'クレジットカードを登録しました'
      # その他のエラー
      else
        flash.now[:notice] = "例外エラーが発生しました。事務局に通報してください"
        render :new
      end
    end
  end

  def show
    @creditcard = Creditcard.find(params[:id])
    @card_data = @creditcard.get_card_data
  end

  def destroy
    @creditcard = Creditcard.find(params[:id])
    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    if customer.delete.deleted
      @creditcard.destroy
      redirect_to new_creditcard_path, notice: "カード情報を削除しました"
    else
      flash.now[:notice] = "カード情報の削除に失敗しました"
      render :show
    end
  end

  private
    def creditcard_params
      params.require(:creditcard).permit(:token).merge(user_id: current_user.id)
    end

    def card_data_params
      params.require(:creditcard).permit(:card_number, :exp_month, :exp_year, :cvv)
    end
end
