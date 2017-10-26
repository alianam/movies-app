class WatchedMoviesController < ApplicationController
  def index
    @watched_movies = WatchedMovie.where(user_id: current_user&.id).order(:date_watched)
    render 'index.html.erb'
  end

  def new
    @movies = Movie.all
    render 'new.html.erb'
  end

  def create
    if current_user&.id
      new_watched_movie = WatchedMovie.create(
        movie_id: params[:movie_id],
        user_id: current_user.id,
        comment: params[:comment],
        date_watched: params[:date_watched],
        theatre_name: params[:theatre_name],
        rating: params[:rating]
      )
        if params[:wishlist_id]
          delete_wishlist = WishlistMovie.find_by(id: params[:wishlist_id])
          delete_wishlist.destroy
        end
      redirect_to '/watched_movies'
    else
      redirect_to '/login'
    end
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
