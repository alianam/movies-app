class CreateWishlistMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlist_movies do |t|
    	t.integer :movie_id
      t.integer :user_id
      t.string :comment
      
      t.timestamps
    end
  end
end
