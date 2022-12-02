require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "visiting the index page with the user name" do
    user = User.create(name: "Test",email:"test@gmail.com",password:"password",password_confirmation:"password",phone:"81234567",date_of_birth:"12/12/2012",address:"yhgygugugu")
    visit users_path
    expect(page).to have_content("Test")
  end

  it "visiting show page with the user name and testing add category button" do
    user = User.create(name: "Test",email:"test@gmail.com",password:"password",password_confirmation:"password",phone:"81234567",date_of_birth:"12/12/2012",address:"yhgygugugu")
    visit user_path(user)
    fill_in "category_title",	with: "sport festivel" 
    click_on "Add Category"
  end

  it "visiting the show page with the user name and testing the link categories list" do
    user = User.create(name: "Test",email:"test@gmail.com",password:"password",password_confirmation:"password",phone:"81234567",date_of_birth:"12/12/2012",address:"yhgygugugu")
    visit user_path(user)
    click_on "Categories List"
  end


end
