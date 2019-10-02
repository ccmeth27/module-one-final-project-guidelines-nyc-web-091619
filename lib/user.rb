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

    def new_usermovie
        loop do
            # prompt.slider("Would you like to watch #{mapped_movies.sample}", max: 2, default: 1)
            UserMovie.new('user_id' => self.id, 'movie_id' => movies.id)
            # prompt.slider("Would you like to watch #{movies.title}", max: 2, default: 1)
                answer = gets.chomp
                if answer == 2 
                    UserMovie.create("#{self.id}", "#{movies.id}")
                    user_movies.watchlist = True
                elsif answer == 0
                    UserMovie.create("#{self.id}", "#{movies.id}")
                    user_movies.rejected = True
                else answer == 1
                    puts movies.description
                    binding.pry
                break
            
            end
            new_usermovie
        end  
    end
   
end #end of user class