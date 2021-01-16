class UsersController < ApplicationController
  before_action :set_user, only: %i[show create_follower delete_follower]
  before_action :set_opinions, only: %i[show]
  skip_before_action :require_login, only: %i[new create]

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
      redirect_to '/opinions#index'
    else
      render :new
    end
  end

  def show
    @user = User.includes(:followers).find(params[:id])
    @followed_by = @user.followed_by(@user)
  end

  def create_follower
    @create_follower = @user.create_follower(@user, current_user)
    redirect_to request.referrer, notice: 'Followed!'
  end

  def delete_follower
    @delete_follower = @user.delete_follower(@user, current_user)
    redirect_to request.referrer, notice: 'Unfollowed!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_opinions
    @opinions = Opinion.all.order('created_at DESC')
  end

  def user_params
    params.require(:user).permit(:id, :username, :fullname, :photo, :coverimage)
  end
end
