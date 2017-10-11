class ChangeIdToIntegerInGenreMovies < ActiveRecord::Migration[5.1]
  def change
  	change_column :genre_movies, :movie_id, 'integer USING CAST(movie_id AS integer)'
  	change_column :genre_movies, :genre_id, 'integer USING CAST(genre_id AS integer)'
  end
end
