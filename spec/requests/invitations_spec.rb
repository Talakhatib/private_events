require 'rails_helper'

RSpec.describe "Invitations", type: :request do
  context "create" do
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      post user_event_invitations_path(user.id,event.id), :params => {:invited_user => user1.id}
    end

  end
end
