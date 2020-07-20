class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
