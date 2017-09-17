class Movie < ApplicationRecord
  has_many :movie_users
  has_many :users, through: :movie_users
  has_many :genre_movies
  has_many :genres, through: :genre_movies
end
