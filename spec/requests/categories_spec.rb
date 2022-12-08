require 'rails_helper'

RSpec.describe "Categories", type: :request do
  context "index" do
    it "returns a success response" do 
    get categories_path
    end
  end

  context "create" do
    it "returns a success response" do 
      user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
      user.save!
      post user_categories_path(user.id),:params => {:category => {:title => "category creation example"}}
    end
  end


end
