class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    # downcasing logged in email (emails are case insensitive)
    # and getting rid of spaces in email 
    email = email.split.first.downcase unless email.empty?
    user = User.find_by_email(email)
    if user.nil? || !user.authenticate(password)
      nil
    else
      user
    end
  end

end
