class MoviesController < ApplicationController
  def index
    @movies_watched = User.find_by(id: 1).movie_users.where(status: "watched")
    render 'index.html.erb'
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end
end
