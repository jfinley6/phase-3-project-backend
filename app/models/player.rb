

class Player 
    def initialize
        @score = 0
        @holding_cards = []
        @hide_first_card = false 
    end

    FACE_OPTIONS = {
    "Ace" => 11,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "Jack" => 10,
    "Queen" => 10,
    "King" => 10
  }

    def recieve_card(card)
        @score += FACE_OPTIONS[card.rank]
        @holding_cards << card
    end
end
