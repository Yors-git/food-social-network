class OpinionsController < ApplicationController
  include ApplicationHelper
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  def index 
    @opinions = Opinion.all.order("created_at DESC")
    @opinion = Opinion.new
    @not_followed_users = @opinion.not_followed_users(current_user)
  end

  def new
    @opinion = current_user.opinions.build
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to root_path, notice: 'Opinion was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    def opinion_params
      params.require(:opinion).permit(:id, :text, :authorid, :user_id)
    end

    # def not_followed_users
    #   if current_user && current_user.inverse_followers.empty?
        # @not_followed_users = User.all.where("id != ?", current_user.id)

    #   elsif current_user && !current_user.inverse_followers.empty?
    #     @followed_users = User.all.where(current_user.inverse_followers.each == current_user.id)
    #     @not_followed_users = User.all - @followed_users
    #   end
    # end
end
