class CodesController < ApplicationController
  before_action :user_logged_in, only: [:userCode]
  def userCode
    @user = User.find(current_user.id)
    @codes = @user.codes
  end
  def new
    @code = Code.new
  end
  def create
    @code = Code.new(post_params)
    if @code.save
      redirect_to userCode_path
    else
      render 'new'
    end
  end
  def destroy

    @submissions.destroy
    @codes.destroy
    redirect_to userCode_path
  end
  def edit

  end
  def update

  end
  private
  def user_logged_in
    if logged_in? == false
      flash[:error] = "You are not logged in."
      redirect_to login_path
    end
  end
  def post_params
    params.require(:user).permit(:info,:name)
  end
end
