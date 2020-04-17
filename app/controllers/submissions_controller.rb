class SubmissionsController < ApplicationController
  before_action :user_logged_in, only: [:userSub]
  include ExecuteHelper

  def userSub
    @user = User.find(current_user.id)
    @submissions = @user.submissions
  end
  def new
    @submission = Submission.new
  end
  def create
    code = Code.find(post_params[:id])
    submission = execute(code.info,post_params[:input])
    @params = {input: post_params[:input], user_id: current_user.id, code_id: post_params[:id],output: submission[:output],status: submission[:status]}
    @submission = Submission.new(@params)
    if @submission.save
      redirect_to userSub_path
    else
      render 'new'
    end
  end
  def index
    @submissions = Submission.all
  end
  def destroy
    @submissions.destroy
    redirect_to userSub_path
  end
  private
  def user_logged_in
    if logged_in? == false
      flash[:error] = "You are not logged in."
      redirect_to login_path
    end
  end
  def post_params
    params.require(:submission).permit(:input,:id)
  end
end
