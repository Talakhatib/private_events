class User < ApplicationRecord
    
    has_many :attend_events,foreign_key: :attendee_id , dependent: :destroy
    has_many :attended_events,through: :attend_events 

    has_many :events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy

    has_many :inviter_invitations, foreign_key: :inviter_id , class_name:"Invitation", dependent: :destroy
    has_many :invited_users , through: :inviter_invitations , source: :invited
    
    has_many :invited_invitation , foreign_key: :invited_id , class_name:"Invitation",dependent: :destroy
    has_many :inviters , foreign_key: :invited_invitations 

    validates :name, presence: true
    
    has_secure_password
    validates :password, presence: true , length: {minimum:6}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum:255}, format: { with: VALID_EMAIL_REGEX } , uniqueness: true
    
    VALID_PHONE_REGEX = /\A\(?(?:\d{2})?\)?[- ]?\d{3}[- ]?\d{3}\z/i
    validates :phone, presence: true , format: { with: VALID_PHONE_REGEX }

    validates :date_of_birth, presence: true
    validates :address, presence: true

end
