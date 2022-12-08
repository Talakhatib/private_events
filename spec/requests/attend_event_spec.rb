require 'rails_helper'

RSpec.describe "AttendEvents", type: :request do
  context "create" do
   it "returns a success response " do 
    user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      post attend_events_path , :params => {:user_id => user1.id,:attended_event_id => event.id}
   end
  end

  context "destroy" do 
    it "returns a success response " do 
        user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
        user.save!
        event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
        event.save!
        user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
        user1.save!
        attend_event = AttendEvent.create!(attendee_id: user1.id,attended_event_id: event.id)
        delete attend_event_path(attend_event.id)
     end
  end
end
