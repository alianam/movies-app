class CreateMovieUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_users do |t|
      t.integer :movie_id
      t.integer :rating
      t.string :theatre_name
      t.string :date_watched
      t.string :comment
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
