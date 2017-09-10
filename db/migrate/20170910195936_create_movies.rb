class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :air_date
      t.string :genre
      t.string :duration
      t.string :imdb_link
      t.string :image

      t.timestamps
    end
  end
end
