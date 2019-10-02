require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new


# binding.pry
new_user = User.new
new_user.greet
input = new_user.get_username
current_user = User.create('username' => input)
# current_user.genre_choice
genre_choice = prompt.select("Select Genre?", %w(action comedy drama horror sci-fi))
genre_movies = Movie.filtered_movies(genre_choice)
mapped_movies = genre_movies.map {|movie| movie.title }
prompt.slider("Would you like to watch #{mapped_movies.sample}", max: 2, default: 1)
current_user.new_usermovie
# puts mapped_movies.sample
# new_um = UserMovie.create(users.id)



puts "DONE"
