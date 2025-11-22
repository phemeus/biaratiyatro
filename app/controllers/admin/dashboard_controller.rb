module Admin
  class DashboardController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def index
      # Fetch all data
      all_plays = Play.all
      all_staff = Staff.all
      all_posts = Post.all
      all_gallery = GalleryImage.all
      all_videos = BackstageVideo.all

      # Counts
      @plays_count = all_plays.count
      @staff_count = all_staff.count
      @posts_count = all_posts.count
      @gallery_count = all_gallery.count
      @videos_count = all_videos.count

      # Upcoming Play (Nearest future date)
      @upcoming_play = all_plays.select { |p| p.date.present? && p.date > Time.current }
                                .min_by(&:date)

      # Recent Activity (Last 5 items)
      @recent_plays = all_plays.sort_by { |p| p.date || Time.at(0) }.reverse.first(5)
      @recent_posts = all_posts.sort_by { |p| p.published_at || Time.at(0) }.reverse.first(5)
    end
  end
end
