class CreateGenreMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :genre_movies do |t|
      t.string :movie_id
      t.string :genre_id

      t.timestamps
    end
  end
end
