require 'rails_helper'

RSpec.describe "Events", type: :request do
  context "index" do
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      get user_events_path(user.id)
    end 
  end

  context "create" do
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      category1 = Category.new(title:"category1",user: user)
      category1.save!
      category2 = Category.new(title:"category2",user: user)
      category2.save! 
      cat1 = category1.id
      cat2 = category2.id
      post user_events_path(user.id),:params => {:event => {:event_date => Time.zone.now,:location =>"anywhere",:creator => user},:categories => [cat1, cat2]}
    end 
  end

  context "edit" do
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      get edit_user_event_path(user.id,event.id)
    end
  end

  context "update" do
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
      event.save!
      put user_event_path(user.id,event.id),:params => {:event => {:event_date => Time.zone.now,:location =>"at my home",:creator => user}}
    end
    
  end

  context "destroy" do
    it "returns a success response" do 
    user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
    user.save!
    event = Event.new(event_date:Time.zone.now,location:"anywhere",creator: user)
    event.save!
    delete user_event_path(user.id,event.id)
    end
  end

end
