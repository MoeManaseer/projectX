class SubmissionsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index

  end
  def show

  end
  def new

  end
  def create

  end
  def destroy

  end
  def userSub

  end
  private
  def require_same_user
    if current_user != @submission.user
      flash[:danger] = "You can only edit or delete your own Submissions"
      redirect_to root_path
    end
  end


  def submission_params

  end
end
