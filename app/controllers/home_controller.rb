class HomeController < ApplicationController
  def index
    @plays = Play.all.sort_by { |p| p.date || Time.at(0) }
    @testimonials = Testimonial.all
    @next_play = @plays.select { |p| p.date.present? && p.date > Time.current }.min_by(&:date)
  end
end
