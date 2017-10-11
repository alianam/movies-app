# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'awesome_print'

# seed the table with movies and their data from csv

csv_text = File.read(Rails.root.join('lib', 'seeds', 'movie_metadata.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  new_movie = Movie.create!(
  	title: row['movie_title'],
	  gross: row['gross'],
	  director: row['director_name'],
	  duration: row['duration'],
	  imdb_link: row['movie_imdb_link']
	)
	genre_array = row['genres'].split('|')
	genre_array.each do |genre|
		new_genre = Genre.find_or_create_by(category: genre)
		GenreMovie.create!(
			movie: new_movie,
			genre: new_genre
		)
	end
end

# puts "There are now #{Movie.count} rows in the movies table."

# seed the table with movies and their data from csv

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'movie_metadata.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#   # t = Genre.new
#   genres = row['genres'].split('|')
#   genres.each do |genre|
    
# end




