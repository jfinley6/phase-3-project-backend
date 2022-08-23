require_relative 'player'
require 'deck'
require 'pry'


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


