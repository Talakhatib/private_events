require 'rails_helper'

RSpec.describe AttendEvent, type: :model do
  context "validation test " do 

    it "presence of attendee" do
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      attend_event = AttendEvent.new(attended_event: event).save
      expect(attend_event).to eq(false)
    end

    it "presence of attended event" do
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      attend_event = AttendEvent.new(attendee: user1).save
      expect(attend_event).to eq(false)
    end
    
    it "should successfuly save" do
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      attend_event = AttendEvent.new(attendee: user1,attended_event: event).save!
      # expect(attend_event).to eq(true)
    end

  end
end
