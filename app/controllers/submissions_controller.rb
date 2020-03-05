class SubmissionsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @submissions = Submission.all
  end
  def show

  end
  def new
    @submission = Submission.new
  end
  def create
    @submission = Submission.new(code: submission_params[:code],input: submission_params[:input],user_id: current_user.id)
    if @submission.save
      redirect_to userSub_path
    else
      render 'new'
    end
  end
  def destroy

  end
  def userSub
    @submissions = Submission.find(user_id: current_user.id)
  end
  def edit

  end
  def update

  end
  private
  def require_same_user
    if current_user != @submission.user
      flash[:danger] = "You can only edit or delete your own Submissions"
      redirect_to root_path
    end
  end


  def submission_params
    params.require(:submission).permit(:code,:input)
  end
end
