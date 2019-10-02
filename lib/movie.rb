require "tty-prompt"

class Movie < ActiveRecord::Base

    has_many :user_movies
    has_many :users, through: :user_movies
    
    Movie.connection
    
    def self.filtered_movies(genre_choice)
        user_movies = Movie.all.select {|movie| movie.genre == genre_choice}
    end
   
    # def movie_lineup
    #     # puts mapped_movies.sample
    #     # prompt.on(:keypress) do |event|
    #     #      if event.value == 'rejected'
    #     #         prompt.trigger(:keyleft)
    #     #         puts 'Plenty of flix in the sea'
    #     #     end
    #     #     if event.value == 'watched'
    #     #         prompt.trigger(:keyright)
    #     #         puts "It's a Match!"
    #     #     end
    #     # end
    # end
    def movie_yes_no
        mapped_movies.sample
        prompt.slider('Swipe', max: 2, default: 1)
        
        
    end


    # def self.swipe
    #     prompt.on(:keypress) do |event|
    #         if event.value == 'rejected'
    #         prompt.trigger(:keyleft)
    #         end
        
    #         if event.value == 'watched'
    #         prompt.trigger(:keyright)
    #         end
    #     end
    # end

end #end of Movie class