require 'json'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
number = 0
url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=abdbe1e8da7f6e8701dcf6048943a0ed&language=en-US&page=1'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

20.times do
  img_url = "https://www.themoviedb.org/t/p/w1280#{user['results'][number]['poster_path']}"
  movie = Movie.new(title: user["results"][number]["original_title"], overview: user["results"][number]["overview"], poster_url: img_url, rating: user["results"][number]["vote_average"])
  movie.save
  number += 1
end
