class AttendEventsController < ApplicationController

    def create
        user = User.find(params[:user_id])
        event = Event.find(params[:attended_event_id])
        attend_event = AttendEvent.new 
        attend_event.attendee_id = user.id
        attend_event.attended_event_id = event.id
        
       if attend_event.save
           redirect_to user
       end
    end
    def destroy
        attend_event = AttendEvent.find(params[:id])
        attend_event.destroy
        redirect_to user_path(attend_event.attendee_id)
    end
end
