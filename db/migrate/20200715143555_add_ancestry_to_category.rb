class AddAncestryToCategory < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :ancestry
  end
end
