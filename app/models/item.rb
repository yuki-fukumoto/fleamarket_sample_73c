class Item < ApplicationRecord
  validates :name, :explanation, :price, :shipping_fee, :condition, presence: true
  enum condition: [:brand_new, :mint, :bit_damaged, :slight_damaged, :damaged]

  belongs_to :user
  belongs_to :purchase
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
end
