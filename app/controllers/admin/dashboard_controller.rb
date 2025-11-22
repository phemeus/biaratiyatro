module Admin
  class DashboardController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def index
      # Fetch counts for dashboard
      @plays_count = Play.all.count
      @staff_count = Staff.all.count
      @posts_count = Post.all.count
      @gallery_count = GalleryImage.all.count
    end
  end
end
