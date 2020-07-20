class CreateItemsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :items_categories do |t|

      t.timestamps
    end
  end
end
