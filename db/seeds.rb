require 'open-uri'

url = "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['THE_MOVIE_DB_KEY']}&language=en-US&page="
# {ENV['THE_MOVIE_DB_KEY']}  ninguem tera acesso pois esta guardada no dotenv

poster_base_url = 'https://api.themoviedb.org/3/movie/{movie_id}/images'
# em movie_data ja tem um arrya de hash, e cada hash vai ter info do filme atravez da url

puts ' Creating movies '.center(40, '=')

# loop de 20 vezes e cada vez acessa paginas diferentes. A cada passada aumenta o numero de paginas
20.times do |i|
  movie_data = JSON.parse(URI.open("#{url}#{i + 1}").read)['results']
  movie_data.each do |movie|
    # vai na db, vai tentar achar um movie com o titulo(titulo tem que ser unico). Se nao encontrar ele segue(next movie)
    next unless Movie.find_by_title(movie['title']).nil?

    movie = Movie.create!(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{poster_base_url}#{movie['poster_path']}",
      rating: movie['vote_average']
    )
    puts "'#{movie.title}' created."
  end
end

puts "#{Movie.count} movies created."

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
