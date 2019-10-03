require "tty-prompt"

class User < ActiveRecord::Base
    has_many :user_movies
    has_many :movies, through: :user_movies

    # prompt = TTY::Prompt.new

    def greet
        puts "Welcome to CineBinge! It's how you pick movies, just like Tinder, but you're alone!"
    end

    def get_username
        puts 'What is your username?'
        print "Enter username:"
        # binding.pry
        input = gets.chomp
        input
    end 

    # def swiped(user_decision)
    #   if user_decision == 2 
    #     UserMovie.update(user_movies.watchlist = t)
    #   end
    #   if user_decision == 0
    #     UserMovie.update(user_movies.rejected = t)
    #   end
    #   if user_decision == 1
    #     puts shown_movie.description
    #   end
    # end


   
end #end of user class