class User < ActiveRecord::Base
  has_secure_password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 5 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

   def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else
      return false
    end
  end
end
