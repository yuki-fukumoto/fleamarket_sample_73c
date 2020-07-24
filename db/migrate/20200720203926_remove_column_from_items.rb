class RemoveColumnFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image, :string
  end
end
