module Admin
  class PlaysController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
      @plays = Play.all
    end

    def new
      @play = Play.new
    end

    def create
      @play = Play.new(play_params)
      if @play.save
        redirect_to admin_plays_path, notice: 'Play was successfully created.'
      else
        render :new
      end
    end

    def edit
      @play = Play.find(params[:id])
    end

    def update
      @play = Play.find(params[:id])
      @play.assign_attributes(play_params)
      if @play.save
        redirect_to admin_plays_path, notice: 'Play was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @play = Play.find(params[:id])
      @play.destroy
      redirect_to admin_plays_path, notice: 'Play was successfully deleted.'
    end

    private

    def play_params
      params.require(:play).permit(:title, :description, :date, :image_url, :youtube_url, :ticket_url)
    end
  end
end
