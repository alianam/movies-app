class AddMovieGrossToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :gross, :integer
  end
end
