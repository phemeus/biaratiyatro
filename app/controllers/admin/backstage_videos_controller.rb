module Admin
  class BackstageVideosController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def index
      @videos = BackstageVideo.all
    end

    def new
      @video = BackstageVideo.new
    end

    def create
      @video = BackstageVideo.new(video_params)
      if @video.save
        redirect_to admin_backstage_videos_path, notice: 'Video başarıyla eklendi.'
      else
        render :new
      end
    end

    def edit
      @video = BackstageVideo.find(params[:id])
    end

    def update
      @video = BackstageVideo.find(params[:id])
      @video.assign_attributes(video_params)
      if @video.save
        redirect_to admin_backstage_videos_path, notice: 'Video başarıyla güncellendi.'
      else
        render :edit
      end
    end

    def destroy
      @video = BackstageVideo.find(params[:id])
      @video.destroy
      redirect_to admin_backstage_videos_path, notice: 'Video başarıyla silindi.'
    end

    private

    def video_params
      params.require(:backstage_video).permit(:title, :youtube_url, :description)
    end
  end
end
