class Submission < ApplicationRecord
  belongs_to :user
  validates :code, presence: true
end