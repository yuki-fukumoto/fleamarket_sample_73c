class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.integer :shipping_fee, null: false
      t.integer :condition, null: false
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
