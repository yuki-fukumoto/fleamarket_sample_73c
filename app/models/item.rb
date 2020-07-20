class Item < ApplicationRecord
  validates :name, :explanation, :price, :shipping_fee, :condition, presence: true

  belongs_to :user
  belongs_to :purchase
  belongs_to :category
  belongs_to :brand
  has_many :items_category_relations
  has_many :categories, through: items_category_relations
  has_many :images, dependent: :destroy

end
