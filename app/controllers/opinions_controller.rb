class OpinionsController < ApplicationController
  def index 
    @opinions = Opinion.all.order("created_at DESC")
    @opinion = Opinion.new
  end

  def new
    @opinion = current_user.opinions.build
  end

  def create
    @opinion = current_user.opinions.build(tweeet_params)

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
end
