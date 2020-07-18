class Category < ApplicationRecord
  validates :name, presence: {message: "システムエラー"}
end
