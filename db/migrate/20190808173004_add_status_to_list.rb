class AddStatusToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :status, :boolean
  end
end
