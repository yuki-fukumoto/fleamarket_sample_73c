class Creditcard < ApplicationRecord
  attr_accessor :token, :error

  validates :customer_id, :card_id, presence: true

  belongs_to :user
  has_many :purchases


  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]

  def self.create_card(params)
    if params[:token].present?
      customer = Payjp::Customer.create(card: params[:token])
      self.create(customer_id: customer.id, card_id: customer.default_card, user_id: params[:user_id])
    else
      false
    end
  end
end
