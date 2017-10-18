class Movie < ApplicationRecord
  has_many :movie_users
  has_many :users, through: :movie_users
  has_many :genre_movies
  has_many :genres, through: :genre_movies

  paginates_per 10

  def movie_poster
    doc = Nokogiri::HTML(open("#{imdb_link}"))
    doc.css('.poster img').first['src']
  end
end
