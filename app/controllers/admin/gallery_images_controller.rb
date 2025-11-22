module Admin
  class GalleryImagesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
      @gallery_images = GalleryImage.all
    end

    def new
      @gallery_image = GalleryImage.new
    end

    def create
      @gallery_image = GalleryImage.new(gallery_image_params)
      if @gallery_image.save
        redirect_to admin_gallery_images_path, notice: 'Image was successfully added.'
      else
        render :new
      end
    end

    def edit
      @gallery_image = GalleryImage.find(params[:id])
    end

    def update
      @gallery_image = GalleryImage.find(params[:id])
      @gallery_image.assign_attributes(gallery_image_params)
      if @gallery_image.save
        redirect_to admin_gallery_images_path, notice: 'Image was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @gallery_image = GalleryImage.find(params[:id])
      @gallery_image.destroy
      redirect_to admin_gallery_images_path, notice: 'Image was successfully deleted.'
    end

    private

    def gallery_image_params
      params.require(:gallery_image).permit(:title, :url)
    end
  end
end
