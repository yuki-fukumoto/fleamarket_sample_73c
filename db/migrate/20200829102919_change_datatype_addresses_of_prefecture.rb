class ChangeDatatypeAddressesOfPrefecture < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :prefecture, :string
  end
end
