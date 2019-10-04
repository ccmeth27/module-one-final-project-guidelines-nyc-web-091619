require "tty-prompt"

class User < ActiveRecord::Base
    has_many :user_movies
    has_many :movies, through: :user_movies

    

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

    
end #end of user class