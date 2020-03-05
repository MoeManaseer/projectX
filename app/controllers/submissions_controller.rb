class SubmissionsController < ApplicationController
  def userSub
    @codes = Code.where(user_id: current_user.id)
  end
end
