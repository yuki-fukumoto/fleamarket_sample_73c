class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.references :creditcard, foreign_key: true

      t.timestamps
    end
  end
end
