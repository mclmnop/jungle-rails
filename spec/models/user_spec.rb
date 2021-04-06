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
  end
end
