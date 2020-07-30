class PurchasesController < ApplicationController
  def create
  end

  def confirm
    @item = Item.find(params[:id])
  end

  private
  def purchase_params
  end
end
