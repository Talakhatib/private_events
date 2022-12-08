require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    it "ensure the name presence" do 
      user = User.new(email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567").save
      expect(user).to eq(false)
    end

    it "ensure the email validation" do 
      user = User.new(name:"example",email:"examplegmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567").save 
      expect(user).to eq(false)
    end

    it "ensure the passowrd confirmation" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"passwor",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567").save   
      expect(user).to eq(false)
    end

    it "should save successfuly" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567").save 
      expect(user).to eq(true)
    end
  end
end
