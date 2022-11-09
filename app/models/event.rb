class Event < ApplicationRecord

    scope :old,-> {where('created_at <= ?', Time.now - (3600*12))}
    scope :recent,->{where('created_at > ?', Time.now-(3600*12))}

    has_many :attend_events , foreign_key: :attended_event_id 
    has_many :attendees , through: :attend_events , source: :attendee
    belongs_to :creator , class_name:"User"

    validates :event_date, presence: true
    validates :location, presence: true
end
