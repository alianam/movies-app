class User < ApplicationRecord
  has_many :watched_movies
  has_many :wishlist_movies
  has_many :movies, through: :watched_movies
  has_many :movies, through: :wishlist_movies
  has_secure_password
end
