class Item < ApplicationRecord
  validates :name, :explanation, :price, :shipping_fee, :condition, presence: true
  mount_uploaders :image, ImageUploader
  serialize :image, JSON

  belongs_to :user
  has_one :purchase
  belongs_to :category
  belongs_to :brand
  # has_one :image, dependent: :destroy
  # accepts_nested_attributes_for :image


end
