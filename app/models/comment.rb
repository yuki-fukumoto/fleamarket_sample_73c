class Comment < ApplicationRecord
  validates :text,presence: true,length: {maximum: 150}
  belongs_to :item
  belongs_to :user
end
