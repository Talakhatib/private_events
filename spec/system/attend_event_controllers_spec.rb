require 'rails_helper'

RSpec.describe "AttendEventControllers", type: :system do
 context "integration test of attend event controller" do 
  it "users can attend an event to other users , after that the can delete this attended event" do 
    user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
    user.save! # user
    event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
    event.save!# create an event with user
    user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
    user1.save!# the other user 
    post attend_events_path , :params => {:user_id => user1.id,:attended_event_id => event.id}# create an attend event with user1
    attend_event = AttendEvent.last 
    delete attend_event_path(attend_event.id)# user1 is deleting the attended event
  end 
 end
end
