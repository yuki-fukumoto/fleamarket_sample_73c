class ChangeZipInAddress < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :zip, :string
  end
  def down
    change_column :addresses, :zip, :integer
  end
end
