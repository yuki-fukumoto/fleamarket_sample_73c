class AddImageToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image, :string, null: false
  end
end
