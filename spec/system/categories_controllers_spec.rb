require 'rails_helper'

RSpec.describe "CategoriesControllers", type: :system do
 context "integration test for categories controller" do 
   it " available user can create a new category and see the list of categories " do 
    user = User.new(name:"example",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012",address:"at saida",phone:"01234567")
    user.save! # user must be available 
    post user_categories_path(user.id),:params => {:category => {:title => "category creation example"}} # creating a new catogory with a specific user
    get categories_path # index(list of categories)
   end
 end 
end
