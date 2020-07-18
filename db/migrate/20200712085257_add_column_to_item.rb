class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_pay, :integer, null: false
    add_column :items, :shipping_area, :integer, null: false
  end
end
