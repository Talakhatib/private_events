require 'rails_helper'

RSpec.describe "IntegrationTests", type: :system do
 
  context " testing " do 

    it "new and create" do
    visit new_user_path
    user = post users_path,:params => { :user => { :name => "Any Name",:email=> "example@gmail.com",:password=> "password",:password_confirmation=> "password",:date_of_birth=> "12/12/2012",:address=> "at saida",:phone=> "01234567" }}
    end

    it "show page of user ,create category,index ,create event ,index,edit event ,update, invite another user,index event,create attend_event,destroy attend_event and destroy event " do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      user1 = User.new(name:"example1",email:"example1@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user1.save!
      visit user_path(user)
      post user_categories_path(user.id),:params => {:category => {:title => "category creation example"}}
      category = Category.last 
      cat1 = category.id
      post user_events_path(user.id),:params => {:event => {:event_date => Time.zone.now,:location =>"anywhere",:creator => user},:categories => [cat1]}
      visit categories_path 
      sleep(5)
      event = Event.last
      get edit_user_event_path(user.id,event.id)
      put user_event_path(user.id,event.id),:params => {:event => {:event_date => Time.zone.now,:location =>"at my home",:creator => user}}
      post user_event_invitations_path(user.id,event.id), :params => {:invited_user => user1.id}
      post attend_events_path , :params => {:user_id => user1.id,:attended_event_id => event.id}
      visit user_path(user)
      sleep(3)
      attend_event = AttendEvent.last
      delete attend_event_path(attend_event.id)
      get user_path(user)
      delete user_event_path(user.id,event.id)
    end

    it "user: index, edit and update" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      visit root_path
      visit edit_user_path(user.id)
      sleep(3)
      put user_path(user.id),:params => { :user => { :name => "Any Name",:email=> "example@gmail.com",:password=> "password",:password_confirmation=> "password",:date_of_birth=> "12/12/2012",:address=> "at saida",:phone=> "01234567" }}
      visit root_path
      sleep(3)
    end
  end

end
