class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  before_action :user_logged_in, only: [:new,:create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(post_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end
  def index
    @users = User.all
  end
  def show
    @user = User.find(current_user.id)
  end
  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    session[:user_id]= nil;
    redirect_to root_path
  end
  def edit
    @user = User.find(current_user.id)
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(post_params)
      flash[:notice] = "User was successfully updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  private
  def post_params
    params.require(:user).permit(:username,:password,:email,:fullname,:country,:image)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
  def user_logged_in
    if logged_in?
      flash[:error] = "You are logged in."
      redirect_to root_path
    end
  end
end
