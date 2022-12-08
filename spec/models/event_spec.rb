require 'rails_helper'

RSpec.describe Event, type: :model do
 context "validations test" do
  it "ensure the presence of user" do 
    event = Event.new(event_date: Time.zone.now,location:"anywhere").save
    expect(event).to eq(false)
  end

  it "ensure the presence of date event" do 
    user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
    user.save!
    event = Event.new(location:"anywhere",creator: user).save
    expect(event).to eq(false)
  end

  it "ensure the presence of location" do 
    user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
    user.save!
    event = Event.new(event_date:Time.zone.now,creator: user).save
    expect(event).to eq(false)
  end

  it "should successfuly save" do 
    user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
    user.save!
    event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user).save!
    # expect(event).to eq(true)
  end
end


end
