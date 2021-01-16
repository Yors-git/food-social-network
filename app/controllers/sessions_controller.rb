class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.notice = "Please enter a valid user or sign up"
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  def login; end

  def welcome; end
end
