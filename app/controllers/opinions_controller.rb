class OpinionsController < ApplicationController
  include ApplicationHelper
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  def index 
    @opinions = Opinion.all.order("created_at DESC")
    @opinion = Opinion.new
    @not_followed_users = @opinion.not_followed_users(current_user).order("created_at DESC")
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
end
