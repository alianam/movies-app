class MoviesController < ApplicationController
  def index
    @movies_watched = User.find_by(id: 1).movie_users.where(status: "watched")
    render 'index.html.erb'
  end

  def show
    @movie = Movie.find_by(id: params[:id]) || MovieUser.find_by(id: params[:id]).movie
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @new_movie = MovieUser.new(
      movie_id: Movie.where("title LIKE ?", "%#{params[:input_title]}%").first.id,
      rating: params[:input_rating],
      theatre_name: params[:input_theatre],
      date_watched: params[:input_date],
      comment: params[:input_comment],
      status: params[:input_status],
      user_id: 1
    )
    @new_movie.save
    redirect_to "/movies/#{@new_movie.id}"
  end
end
