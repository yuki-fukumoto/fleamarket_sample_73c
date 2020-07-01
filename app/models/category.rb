class Category < ApplicationRecord
  validates :name, presence: true
  has_ancestry

  def self.get_categories(ancestry)
    self.where(ancestry: ancestry)
  end
end
