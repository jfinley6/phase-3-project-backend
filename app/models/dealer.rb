require_relative 'player'
require 'deck'



class Dealer < Player
    
    MAX_DECIDE_SCORE = 17

    def initialize
        super
        @hide_first_card = true
    end

    def decide
        @score < MAX_DECIDE_SCORE
    end
end


