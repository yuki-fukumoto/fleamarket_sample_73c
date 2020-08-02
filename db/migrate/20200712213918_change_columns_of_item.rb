class ChangeColumnsOfItem < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :shipping_pay, :integer, default: 0
    change_column :items, :shipping_area, :integer, default: 0
    change_column :items, :shipping_period, :integer, default: 0
    change_column :items, :status, :integer, default: 0
  end

  def down
    change_column :items, :shipping_pay, :integer
    change_column :items, :shipping_area, :integer
    change_column :items, :shipping_period, :integer
    change_column :items, :status, :integer
  end
end
