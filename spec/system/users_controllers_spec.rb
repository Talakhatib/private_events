require 'rails_helper'

RSpec.describe "UsersControllers", type: :system do
   context "integration testing of user controller" do 
    it "first index page will appear the user can go to new page and create his own account after that go to show page he can go to edit page and update his information" do 
        get root_path #index 
        get new_user_path #new  
        post users_path,:params => { :user => { :name => "example",:email=> "example@gmail.com",:password=> "password",:password_confirmation=> "password",:date_of_birth=> "12/12/2012",:address=> "at saida",:phone=> "01234567" }} #creation of new user
        user = User.last 
        get user_path(user) #show 
        get  edit_user_path(user ) #edit 
        put user_path(user.id),:params => { :user => { :name => "Any Name",:email=> "example@gmail.com",:password=> "password",:password_confirmation=> "password",:date_of_birth=> "12/12/2012",:address=> "at saida",:phone=> "01234567" }} #update user    
   end
  end
end
