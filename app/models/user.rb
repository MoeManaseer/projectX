class User < ApplicationRecord
  validates :username,uniqueness: true, presence:true, length: {minimum:6,maximum:20}
  validates :fullname, presence:true, length: {minimum:6,maximum:40}
  validates :email,uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :country, presence:true
  has_secure_password
  has_many :submissions
  has_many :codes
  has_one_attached :image
end
