class WishlistMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :genre_movies
  has_many :genres, through: :genre_movies
end
