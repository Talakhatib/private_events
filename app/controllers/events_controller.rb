class EventsController < ApplicationController
    def index
        @events = Event.all
        @user = User.find(params[:user_id])
    end
    def create
        @user = User.find(params[:user_id])
        
       if @user.events.create!(event_params)
          flash[:success]= "New event was added!!"
          redirect_to user_path(@user)
       end
    end
    def destroy
        user = User.find(params[:user_id])
        event = user.events.find_by(params[:id])
        event.destroy
        redirect_to user_path(user)
    end

    private 
    
    def event_params 
        params.require(:event).permit(:event_date,:location,:creator_id)
    end
end
