class Event < ApplicationRecord

    scope :old,-> {where('created_at <= ?', Time.now - (3600*24))}
    scope :recent,->{where('created_at > ?', Time.now-(3600*24))}

    has_many :attend_events , foreign_key: :attended_event_id 
    has_many :attendees , through: :attend_events , source: :attendee
    belongs_to :creator , class_name:"User"

    has_many :invitations , foreign_key: :event_id , class_name:"Invitation"
    has_many :invited_users, through: :invitations, source: :invited

    validates :event_date, presence: true
    validates :location, presence: true
    
end
