class HomeController < ApplicationController
  def index
    @plays = Play.all
  end
end
