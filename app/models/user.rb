class User < ActiveRecord::Base
  has_secure_password
  has_many :review
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation , presence: true, length: { minimum: 6 }


  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(["email = ?", email.strip.downcase])
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

  end
  
end
