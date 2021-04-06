class User < ActiveRecord::Base
  has_secure_password
  #normalize_attribute  :email, :with => :strip
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 5 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  puts "DEDNAS CLASSE"
  puts self.inspect


  # def authenticate_with_credentials(email, password)
  #   user = User.find_by_email(email)
  #   if user && user.authenticate(password)
  #     session[:user_id] = user.id
  #   else
  #     return false
  #   end
  # end
   def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else
      return false
    end
  end
end
