class Category < ApplicationRecord
  has_many :items
  has_ancestry
  has_many :items_category_relations
  has_many :items, through: :items_category_relations

  validates :name, presence: true
end
