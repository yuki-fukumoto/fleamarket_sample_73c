class RemoveShippingFeeFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_fee, :integer, null: false
  end
end
