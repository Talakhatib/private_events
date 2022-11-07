class Event < ApplicationRecord
    has_many :attend_events , foreign_key: :attended_event_id 
    has_many :attendees , through: :attend_events , source: :attendee
    belongs_to :creator , class_name:"User"

    validates :event_date, presence: true
    validates :location, presence: true
end
