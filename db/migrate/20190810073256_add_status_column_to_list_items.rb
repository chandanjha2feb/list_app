class AddStatusColumnToListItems < ActiveRecord::Migration[5.2]
  def change
    add_column :list_items, :status, :boolean
  end
end
