class Invitation < ApplicationRecord
    belongs_to :inviter, class_name:"User"
    belongs_to :invited, class_name:"User"
    belongs_to :event, class_name:"Event"
end
