class WishlistMoviesController < ApplicationController
  def index
    @wishlist_movies = WishlistMovie.all
    render 'index.html.erb'
  end

  def show
    @wishlist_movie = WishlistMovie.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    @movies = Movie.all
    render 'new.html.erb'
  end

  def create
    new_wishlist_movie = WishlistMovie.create!(
      movie_id: params[:movie_id],
      # change this to param
      user_id: 1,
      comment: params[:comment]
    )
    redirect_to '/wishlist_movies'
  end

  def update
    wishlist_movie = WishlistMovie.find_by(id: params[:id])
    wishlist_movie.update(
      # change to a param
      comment: params[:comment]
    )
  redirect_to '/wishlist_movies'
  end
end
