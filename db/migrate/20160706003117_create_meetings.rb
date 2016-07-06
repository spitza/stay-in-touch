class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :invitee
      t.boolean :work
      t.integer :frequency
      t.boolean :active

      t.timestamps
    end
    add_index :meetings, [:user_id, :created_at]
  end
end
