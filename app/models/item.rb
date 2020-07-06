class Item < ApplicationRecord
  validates :name, :explanation, :price, :shipping_fee, :condition, presence: true

  belongs_to :user
  has_one :purchase
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
end
