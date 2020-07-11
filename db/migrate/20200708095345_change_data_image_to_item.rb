class ChangeDataImageToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :image, :text

  end
end
