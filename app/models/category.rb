class Category < ApplicationRecord
  validates :name, presence: true

  def self.get_categories(ancestry)
    self.where(ancestry: ancestry)
  end
end
