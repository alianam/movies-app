class WatchedMoviesController < ApplicationController
  def index
    @watched_movies = WatchedMovie.order(:date_watched)
    render 'index.html.erb'
  end

  def new
    @movies = Movie.all
    render 'new.html.erb'
  end

  def create
    new_watched_movie = WatchedMovie.create(
      movie_id: params[:movie_id],
      # change this to a param
      user_id: 1,
      comment: params[:comment],
      date_watched: params[:date_watched],
      theatre_name: params[:theatre_name],
      rating: params[:rating]
    )
    redirect_to '/watched_movies'
  end

  def edit
    @watched_movie = WatchedMovie.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    update_movie = WatchedMovie.find_by(id: params[:id]) 
    update_movie.update(
      comment: params[:comment],
      date_watched: params[:date_watched],
      theatre_name: params[:theatre_name],
      rating: params[:rating]
    )
    redirect_to '/watched_movies'
  end
end
