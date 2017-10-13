class WatchedMoviesController < ApplicationController
  def index
    @watched_movies = WatchedMovie.order(:date_watched)
    render 'index.html.erb'
  end

  def new
    @movies = Movie.all
    render 'new.html.erb'
  end
end
