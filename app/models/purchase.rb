class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :address
  belongs_to :creditcard
end
