class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :categories, :ancestry,:string, null: true
  end
  def down
    change_column :categories, :ancestry,:string, null: false
  end
end
