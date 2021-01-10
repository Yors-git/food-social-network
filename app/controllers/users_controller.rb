class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index 
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "User #{@user[:username]} Created!"
      session[:user_id] = @user.id
      redirect_to 'root'
    else
      render :new
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :username, :fullname, :photo, :coverimage)
  end
end
