class BackstageController < ApplicationController
  def index
    @videos = BackstageVideo.all
  end

  def show
    @video = BackstageVideo.find(params[:id])
  end
end
