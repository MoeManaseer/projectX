class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :code
end
