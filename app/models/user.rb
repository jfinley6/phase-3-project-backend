require_relative 'player'

class User < Player
    def initialize
        super
    end

    MAX_DECIDE_SCORE = 22

    def decide 
        @score < MAX_DECIDE_SCORE
    end

end