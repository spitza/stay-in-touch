class ChangeTypeToWorkOrPlay < ActiveRecord::Migration[5.0]
  def change
    rename_column :meetings, :type, :work_or_play
  end
end
