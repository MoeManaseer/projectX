class User < ApplicationRecord
  validates :username, precense:true, length: {minimum:6,maximum:20}
  has_secure_password
  has_many :submissions
end
