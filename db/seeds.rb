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
row_counter = 2

csv.each do |row|
  row_counter += 1
  t = Movie.new
  t.title = row['movie_title']
  t.title
  t.director = row['director_name']
  t.genre = row['genres']
  t.duration = row['duration']
  t.imdb_link = row['movie_imdb_link']
  t.save
end

puts "There are now #{Movies.count} rows in the movies table."