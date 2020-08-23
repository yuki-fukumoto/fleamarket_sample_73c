class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :firstname_read, null: false
      t.string :lastname_read, null: false
      t.integer :zip, null: false
      t.string :prefecture_id, null: false
      t.string :city, null: false
      t.string :address_line, null: false
      t.string :building
      t.string :room
      t.integer :telephone
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
