class User < ApplicationRecord
    
    has_many :attend_events,foreign_key: :attendee_id 
    has_many :attended_events,through: :attend_events
    has_many :events, foreign_key: :creator_id, class_name: "Event" , dependent: :destroy
    # accepts_nested_attributes_for :created_events

     validates :name, presence: true

end
