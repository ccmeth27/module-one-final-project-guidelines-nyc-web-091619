require "tty-prompt"

class UserMovie < ActiveRecord::Base

    belongs_to :user
    belongs_to :movie 

    #  prompt.on(:keypress) do |event|
    #     if event.value == 'l'
    #     prompt.trigger(:keyleft)
    #     end
    
    #     if event.value == 'r'
    #     prompt.trigger(:keyright)
    #     end
    # end

end #end of UserMovie class