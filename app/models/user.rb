class User < ActiveRecord::Base
  has_secure_password

  has_many :links

  validates :email, uniqueness: true, email_format: { message: " is not in a valid format" }
  validates :password, length: { minimum: 8, message: "must have a minimum of 8 characters"}
  validates :password_confirmation, presence: true
end
