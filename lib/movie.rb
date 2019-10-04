require "tty-prompt"

class Movie < ActiveRecord::Base

    has_many :user_movies
    has_many :users, through: :user_movies
    
    Movie.connection
    
    def self.filtered_movies(genre_choice)
        user_movies = Movie.all.select {|movie| movie.genre == genre_choice}
    end

end #end of Movie class