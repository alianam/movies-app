class RenameMovieUserTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :movie_users
  end
end
