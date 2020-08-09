class Creditcard < ApplicationRecord
  validates :customer_id, :card_id, presence: true

  belongs_to :user
  has_many :purchases


  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]

  def self.create_card(params)
    binding.pry
    customer = Payjp::Customer.create
    self.create(customer_id: customer.id, card_id: params[:card_id], user_id: params[:user_id])
  end
end
