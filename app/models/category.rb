class Category < ApplicationRecord
  validates :name, presence: {message: "システムエラー"}
  has_ancestry
end
