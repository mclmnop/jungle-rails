require 'rails_helper'

RSpec.feature "Visitor can add to cart", type: :feature, js: true do

  #SETUP
  before :each do
    @user = User.create!(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd55", password_confirmation:"pwd55")
  end

  scenario "User can login succesfully" do
    visit login_path
    save_screenshot 'user_login_test1.png'
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on('Submit')
    visit root_path
    save_screenshot 'user_login_test2.png'
    expect(page).to have_css '.signed_in'
  end
end
