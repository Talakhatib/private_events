require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation test" do

    it "ensure the presence of user" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      category = Category.new(title:"category1").save
      expect(category).to eq(false)
    end

    it "ensure the presence of title" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      category = Category.new(user: user).save
      expect(category).to eq(false)
    end

    it "should successfuly save" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      category = Category.new(title:"category1",user: user).save!
      # expect(category).to eq(true)
    end
 
  end
  
end
