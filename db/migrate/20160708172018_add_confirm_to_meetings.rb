class AddConfirmToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :confirmed, :boolean, default: false
  end
end
