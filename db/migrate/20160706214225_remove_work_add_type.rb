class RemoveWorkAddType < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :work, :boolean
    add_column :meetings, :type, :string
  end
end
