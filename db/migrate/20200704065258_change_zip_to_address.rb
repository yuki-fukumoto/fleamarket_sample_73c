class ChangeZipToAddress < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :telephone, :string
  end
  def down
    change_column :addresses, :telephone, :integer
  end
end
