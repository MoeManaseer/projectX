class User < ApplicationRecord
  validates :username, presence:true, length: {minimum:6,maximum:20}
  validates :fullname, presence:true, length: {minimum:6,maximum:20}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
  has_many :submissions
end
