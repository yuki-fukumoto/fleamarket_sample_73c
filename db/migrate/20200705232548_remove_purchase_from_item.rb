class RemovePurchaseFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :purchase, foreign_key: true
  end
end
