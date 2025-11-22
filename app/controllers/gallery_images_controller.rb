class GalleryImagesController < ApplicationController
  def index
    @gallery_images = GalleryImage.all
  end
end
