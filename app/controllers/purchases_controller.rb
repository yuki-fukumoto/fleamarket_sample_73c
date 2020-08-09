class PurchasesController < ApplicationController
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]

  def create
    @item = Item.find(params[:item_id])
    if @purchase = Purchase.create_charge(purchase_params, @item)
      @item[:status] = "sold"
      @item.save
      redirect_to root_path, notice: "購入しました"
    else
      flash.now[:notice] = "申し訳ございません、購入に失敗しました。再度、ご購入手続きお願いいたします"
      render confirm_purchases_path
    end
  end

  def confirm
    @purchase = Purchase.new
    @item = Item.find(params[:id])
    user = User.find(current_user.id)
    @address = user.addresses.first
    @creditcard = user.creditcards.first


    if @creditcard.presence
      customer = Payjp::Customer.retrieve(@creditcard.customer_id)
      @creditcard_payjp = customer.cards.retrieve(@creditcard.card_id)
    else @creditcard.blank?
      redirect_to new_creditcard_path, notice: "購入前にクレジットカードをご登録ください"
    end
  end

  private
  def purchase_params
    params.permit(:address_id, :item_id, :creditcard_id).merge(user_id: current_user.id)
  end
end
