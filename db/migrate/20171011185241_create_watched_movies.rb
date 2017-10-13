class CreateWatchedMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :watched_movies do |t|
      t.integer :movie_id
      t.integer :user_id
      t.string :comment
      t.string :date_watched
      t.string :theatre_name
      t.string :rating

      t.timestamps
    end
  end
end
