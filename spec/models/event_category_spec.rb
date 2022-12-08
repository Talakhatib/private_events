require 'rails_helper'

RSpec.describe EventCategory, type: :model do
  context "validation test" do 

    it "the presence of event" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      category = Category.new(title:"category1",user: user)
      category.save!
      event_category = EventCategory.new(category: category).save
      expect(event_category).to eq(false)
    end

    it "the presence of category" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      category = Category.new(title:"category1",user: user)
      category.save!
      event_category = EventCategory.new(event: event).save
      expect(event_category).to eq(false)
    end

    it "should successfully save" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      event = event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      category = Category.new(title:"category1",user: user)
      event_category = EventCategory.new(category: category,event: event).save
      expect(event_category).to eq(true)
    end

  end
end
