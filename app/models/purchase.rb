class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :address
  belongs_to :creditcard

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]

  def self.create_charge(params, item)
    creditcard = Creditcard.find(params[:creditcard_id])
    charge = Payjp::Charge.create(
      amount: item.price,
      currency: "jpy",
      customer: creditcard.customer_id
    )
    @purchase = Purchase.new(params)
    @purchase[:charge_id] = charge.id
    @purchase.save
  end
end
