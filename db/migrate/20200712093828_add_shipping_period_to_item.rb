class AddShippingPeriodToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_period, :integer, null: false
  end
end
