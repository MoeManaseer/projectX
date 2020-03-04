class SessionsController < ApplicationController
  before_action :user_logged_in, only: [:new,:create]
  def new

  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'new'
    end
  end
  def destroy
    session[:user_id]= nil;
    redirect_to root_path
  end

  private
  def user_logged_in
    if logged_in?
      flash[:error] = "You are logged in."
      redirect_to root_path
    end
  end
end
