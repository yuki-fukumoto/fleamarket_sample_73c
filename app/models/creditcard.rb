class Creditcard < ApplicationRecord
  validates :custormer_id, :card_id, presence: true

  belongs_to :user
  has_many :purchases
end
