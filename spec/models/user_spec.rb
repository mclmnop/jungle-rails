require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "needs to have password and password confirmation field filled" do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd55", password_confirmation:"pwd55")
      expect(@user.save).to be true
    end
    it "Password and password confirmation fields need to be the same or it will not work" do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd", password_confirmation:"pwd1")
      expect(@user.save).to be false
    end
    it "Emails must be unique (not case sensitive)" do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd", password_confirmation:"pwd1")
      @user2 = User.new(first_name:"Yohann", last_name:"Miller", email: "GREGO@yo.com", password:"pwd", password_confirmation:"pwd1")
      expect(@user2.save).to be false
    end
    it "First Name and Last Name should be present" do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd55", password_confirmation:"pwd55")
      expect(@user.save).to be true
    end
    it "Password should have minimum length of 5 characters" do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd", password_confirmation:"pwd")
      expect(@user.save).to be false
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should authenticate user with right password and return user object' do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd55", password_confirmation:"pwd55")
      @user.save
      auth = User.authenticate_with_credentials("grego@yo.com", "pwd55")
      expect(auth).to have_attributes(:first_name => "Grego", :last_name => "Hill")
    end
    it 'should authenticate user even if email case changes' do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd55", password_confirmation:"pwd55")
      @user.save
      auth = User.authenticate_with_credentials("greGO@yo.com", "pwd55")
      expect(auth).to have_attributes(:first_name => "Grego", :last_name => "Hill")
    end
    it 'should authenticate user even if email contains spaces' do
      @user = User.new(first_name:"Grego", last_name: "Hill", email: "grego@yo.com", password:"pwd55", password_confirmation:"pwd55")
      @user.save
      auth = User.authenticate_with_credentials(" grego@yo.com", "pwd55")
      expect(auth).to have_attributes(:first_name => "Grego", :last_name => "Hill")
    end


  end
end
