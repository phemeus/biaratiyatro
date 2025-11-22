class SearchController < ApplicationController
  def index
    @query = params[:q]
    @results = []

    if @query.present?
      # Search Plays
      plays = Play.all.select { |p| p.title.to_s.downcase.include?(@query.downcase) || p.description.to_s.downcase.include?(@query.downcase) }
      plays.each { |p| @results << { type: 'Oyun', title: p.title, url: play_path(p.id), date: p.date } }

      # Search Posts
      posts = Post.all.select { |p| p.title.to_s.downcase.include?(@query.downcase) || p.content.to_s.downcase.include?(@query.downcase) }
      posts.each { |p| @results << { type: 'Blog', title: p.title, url: post_path(p.id), date: p.published_at } }
    end
  end
end
