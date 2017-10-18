class MoviesController < ApplicationController
  # autocomplete :movie, :title

  def index
    @movies = Movie.all.page params[:page]
    # @movies = Movie.order(:title).page params[:page]
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
      title: params[:title],
      director: params[:director],
      air_date: params[:air_date],
      genre: params[:genre],
      duration: params[:duration],
      imdb_link: params[:imdb_link]
    )
    @new_movie.save
    redirect_to "/movies/#{@new_movie.id}"
  end
end
