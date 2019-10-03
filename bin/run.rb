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
ruby loop {
shown_movie = genre_movies.shift
user_decision = prompt.slider("Would you like to watch #{shown_movie.title}", max: 2, default: 1)
UserMovie.new('user_id' => current_user.id, 'movie_id' => shown_movie.id )
new_um = UserMovie.create(user_id: current_user.id, movie_id: shown_movie.id)

abc = new_um.swiped(user_decision)}
# binding.pry
# puts mapped_movies.sample




puts "DONE"
