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

    def menu_option
        prompt = TTY::Prompt.new
        choices = ['View my watchlist', 'Broaden your horizons', 'Delete Browsing History']
        menu_choice = prompt.select("What would you like to do?", choices)
        if menu_choice == 'View my watchlist'
            # um_all = UserMovie.all.select {|um| um.user_id == self.id && um.watchlist == true}
            # a = um_all.select {|um| um.watchlist == true  }
            # b = Movie.all.select {|mov| mov.id == a}
            # um_all = self.user_movies.map do |um| 
            #     if um.watchlist == true
            #         binding.pry
            #         um_all.each.movie
            #     end
            # end
            # c = a.map {|um| um.movie_id }
        end
    end
end #end of user class