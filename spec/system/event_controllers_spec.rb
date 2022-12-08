require 'rails_helper'

RSpec.describe "EventControllers", type: :system do
   context "integration test for event controller " do 
     it "after creating new user user can add an event with categories ,update the event also he can delete it .User can go to list of events " do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save! # user must be available 
      category1 = Category.new(title:"category1",user: user)
      category1.save! # event must have a category at least
      cat1 = category1.id
      post user_events_path(user.id),:params => {:event => {:event_date => Time.zone.now,:location =>"anywhere",:creator => user},:categories => [cat1]} # creating event
      event = Event.last 
      get edit_user_event_path(user.id,event.id) # edit
      put user_event_path(user.id,event.id),:params => {:event => {:event_date => Time.zone.now,:location =>"at my home",:creator => user}}
      get user_events_path(user.id) # index 
      delete user_event_path(user.id,event.id) # delete event
     end
   end
end
