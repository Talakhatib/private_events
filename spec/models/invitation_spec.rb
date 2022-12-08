require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context "validation test" do 

    it "the presence of invited user " do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      invitation = Invitation.new(inviter: user , event: event).save
      expect(invitation).to eq(false)
    end

    it "the presence of inviter user " do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      invitation = Invitation.new(invited: user1 , event: event).save
      expect(invitation).to eq(false)
    end

    it "the presence of event " do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save
      invitation = Invitation.new(inviter: user,invited: user1).save
      expect(invitation).to eq(false)
    end

    it "should successfuly save " do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      invitation = Invitation.new(inviter:user,invited: user1 , event: event).save!
      # expect(invitation).to eq(true)
    end
  
  end
end
