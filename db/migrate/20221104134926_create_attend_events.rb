class CreateAttendEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :attend_events do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
    add_index :attend_events, :attendee_id
    add_index :attend_events, :attended_event_id
    add_index :attend_events, [:attendee_id,:attended_event_id],unique: true
  end
end
