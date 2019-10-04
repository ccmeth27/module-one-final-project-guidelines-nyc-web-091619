require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new

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
system "clear"
swiper = new_um.swiped(user_decision)
    break if genre_movies.empty?
end
choices = ['View my watchlist', 'Broaden your horizons', 'Clear user history']
menu_choice = prompt.select("What would you like to do?", choices)
    if menu_choice == 'View my watchlist'
        um_all = UserMovie.all.select {|um| um.user_id == current_user.id && um.watchlist == true}
            um_all.each {|um| puts um.movie.title}
    end
    if menu_choice == 'Broaden your horizons'
        genre_choice = prompt.select("Select Genre?", %w(action comedy drama horror sci-fi))
        genre_movies = Movie.filtered_movies(genre_choice)

        loop do
        shown_movie = genre_movies.shift
        user_decision2 = prompt.slider("Would you like to watch #{shown_movie.title}", max: 2, default: 1)
        UserMovie.new('user_id' => current_user.id, 'movie_id' => shown_movie.id )
        new_um = UserMovie.create(user_id: current_user.id, movie_id: shown_movie.id)
        system "clear"
        swiper = new_um.swiped(user_decision2)
        break if genre_movies.empty?
        end
    end
    if menu_choice == 'Clear user history'
        clear = UserMovie.all.select {|um| um.user_id == current_user.id && um.watchlist == true}
        clear.each {|um| um.delete}
        puts "Hate to see you go, but I love to watch you leave"
    end 

puts " "
puts " "

puts "Same time tomorrow? 😉"

