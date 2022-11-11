class User < ApplicationRecord
    
    has_many :attend_events,foreign_key: :attendee_id 
    has_many :attended_events,through: :attend_events
    has_many :events, foreign_key: :creator_id, class_name: "Event" , dependent: :destroy
    # accepts_nested_attributes_for :created_events
    has_many :inviter_invitations, foreign_key: :inviter_id , class_name:"Invitation"
    has_many :invited_users , through: :inviter_invitations , source: :invited
    
    has_many :invited_invitation , foreign_key: :invited_id , class_name:"Invitation"
    has_many :inviters , foreign_key: :invited_invitations 

     validates :name, presence: true

end
