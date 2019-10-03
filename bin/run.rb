require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new


# binding.pry
new_user = User.new
new_user.greet
input = new_user.get_username
current_user = User.create('username' => input)
genre_choice = prompt.select("Select Genre?", %w(action comedy drama horror sci-fi))
genre_movies = Movie.filtered_movies(genre_choice)

loop do
shown_movie = genre_movies.shift
user_decision = prompt.slider("Would you like to watch #{shown_movie.title}", max: 2, default: 1)
UserMovie.new('user_id' => current_user.id, 'movie_id' => shown_movie.id )
new_um = UserMovie.create(user_id: current_user.id, movie_id: shown_movie.id)
swiper = new_um.swiped(user_decision)
    break if genre_movies.empty?
end

selection = current_user.menu_option







puts "DONE"

# menu_choice = prompt.select("What would you like to do?") do |menu|
#     menu.choice 'View my watchlist'
#     menu.choice 'Broaden your horizons'
#     menu.choice 'Delete Browsing History'
#   end