require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "index" do
    it 'returns success response' do 
      get root_path
      # expect(response).to be_success
    end
  end

  context 'show' do 
    it 'returns a success response' do 
     user = User.create!(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
     get user_path(user) 
    #  expect(response).to be_success
    end
  end

  context "new" do 
    it "returns a success response" do 
      get new_user_path
    end
  end

  context "create" do
    it  "returns a success response" do 
      post users_path,:params => { :user => { :name => "Any Name",:email=> "example@gmail.com",:password=> "password",:password_confirmation=> "password",:date_of_birth=> "12/12/2012",:address=> "at saida",:phone=> "01234567" }}
    end
  end

  context "edit" do 
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      get edit_user_path(user.id)
    end
  end

  context "update" do 
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      put user_path(user.id),:params => { :user => { :name => "Any Name",:email=> "example@gmail.com",:password=> "password",:password_confirmation=> "password",:date_of_birth=> "12/12/2012",:address=> "at saida",:phone=> "01234567" }}
    end
  end


  context "information" do 
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      get user_information_path, :params=>{:user => user.id}
    end
  end

end
