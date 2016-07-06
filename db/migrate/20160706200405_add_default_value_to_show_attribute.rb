class AddDefaultValueToShowAttribute < ActiveRecord::Migration[5.0]
  def up
    change_column :meetings, :work, :boolean, :default => false
  end

  def down
    change_column :meetings, :work, :boolean, :default => nil
  end
end
