class AttendEvent < ApplicationRecord
    belongs_to :attendee, class_name:"User" 
    belongs_to :attended_event, class_name:"Event",dependent: :destroy
    
    scope :get_id,-> (attendee) {where('attendee_id=? ',attendee).ids}
end
