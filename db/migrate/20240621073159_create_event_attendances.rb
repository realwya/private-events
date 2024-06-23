class CreateEventAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendances do |t|
      t.references :event_attendee, null: false, foreign_key: { to_table: :users }
      t.references :attended_event, null: false, foreign_key: { to_table: :events }
      t.timestamps
    end

    add_index :event_attendances, [:event_attendee_id, :attended_event_id], unique: true, name: 'index_event_attendances_on_attendee_and_event'
  end
end
