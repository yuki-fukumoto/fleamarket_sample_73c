class CreateBrowsingHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :browsing_histories do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.timestamps
    end
  end
end
