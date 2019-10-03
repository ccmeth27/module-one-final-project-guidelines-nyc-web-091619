require "tty-prompt"

class UserMovie < ActiveRecord::Base

    belongs_to :user
    belongs_to :movie 

    def swiped(user_decision)
        if user_decision == 2 && watchlist == false
          self.update(watchlist: true)
        end
        if user_decision == 0 && rejected == false
          self.update(rejected: true)
        end
        if user_decision == 1
            match_mov = Movie.all.find { |movie| movie.id == self.movie_id  }
            puts match_mov.description
        end
      end

end #end of UserMovie class