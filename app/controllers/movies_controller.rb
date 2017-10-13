class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:title).page params[:page]
    render 'index.html.erb'
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    # Make this for admin users only, so we can add manually
    render 'new.html.erb'
  end

  def create
    @new_movie = Movie.new(
      title: params[:input_title],
      director: params[:input_director],
      air_date: params[:input_air_date],
      genre: params[:input_genre],
      duration: params[:input_duration],
      imdb_link: params[:input_imdb_link],
    )
    @new_movie.save
    redirect_to "/movies/#{@new_movie.id}"
  end
end
