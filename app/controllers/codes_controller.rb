class CodesController < ApplicationController
  def userCode
    @codes = Code.where(user_id: current_user.id)
  end
end
