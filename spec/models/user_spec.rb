require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "needs to have password and password confirmation field filled" do
      @user = User.new(name:"Grego", email: "grego@yo.com", password:"pwd", password_confirmation:"pwd")
      expect(@user.save).to be true
    end
    it "Password and password confirmation fields need to be the same or it will not work" do
      @user = User.new(name:"Grego", email: "grego@yo.com", password:"pwd", password_confirmation:"pwd1")
      expect(@user.save).to be false
    end
  end
end
