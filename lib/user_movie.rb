require "tty-prompt"

class UserMovie < ActiveRecord::Base

    belongs_to :user
    belongs_to :movie 

    

    def swiped(user_decision)
        prompt = TTY::Prompt.new
        if user_decision == 2 && watchlist == false
          self.update(watchlist: true)
          
        end
        if user_decision == 0 && rejected == false
          self.update(rejected: true)
          
        end
        if user_decision == 1
            match_mov = Movie.all.find { |movie| movie.id == self.movie_id  }
            puts match_mov.description
            plan_b = prompt.select("Add this movie to your wishlist?") do |menu|
                menu.choice 'Yes'
                menu.choice 'No'
              end
            if plan_b == 'Yes'
                self.update(watchlist: true)
            end
            if plan_b == 'No'
                self.update(rejected: true)
            end
        end
      end

end #end of UserMovie class