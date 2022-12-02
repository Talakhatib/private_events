class EventsController < ApplicationController

    def index
        events = Event.all
        @old_events = events.old
        @recent_events = events.recent
        @user = User.find(params[:user_id])
    end

    def create
        @user = User.find(params[:user_id])
        categories = params[:categories]
        if @user.events.create(event_params)
          event = Event.find_by(event_params)
          categories.each do |cat|
            category = Category.find(cat)
            EventCategory.create!(event: event ,category: category )
          end
          flash[:success]= "New event was added!!"
          redirect_to user_path(@user)
       end
    end

    def edit
        @user = User.find(params[:user_id])
        @event =Event.find(params[:id])
    end

    def update
       @user = User.find(params[:user_id])
       @event = Event.find(params[:id]) 
       if @event.update!(event_params)
          flash[:success] = "The event was successfully updated!!"
          redirect_to user_path(@user)
       end
    end

    def destroy
        user = User.find(params[:user_id])
        event = user.events.find_by(id: params[:id])
        event.destroy
        redirect_to user_path(user)
    end

    private 
    
    def event_params 
        params.require(:event).permit(:event_date,:location,:creator_id)
    end
end
