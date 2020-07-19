class Item < ApplicationRecord
  validates :name, :explanation, :price, :shipping_fee, :condition, presence: true

  belongs_to :user
  belongs_to :purchase
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy

  enum status: { sell: 0, buy: 1, trading:2}

  scope :on_sell, -> { where(status: 0)}
end
