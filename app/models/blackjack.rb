require 'deck'
require 'pry'

class Blackjack
    MAX = 21
    def initialize(deck, hand, dealer)
        @deck = Deck.new
        @hand = Hand.new
        @dealer = Dealer.new
        @is_finished = false
        give_initial_cards_to(@hand)
        give_initial_cards_to(@dealer)
    end

    def give_initial_cards_to(player)
        2.times {give_card_to(player)}
    end

    def give_cards_to(player)
        card = @deck.draw
        player.recieve_card(card)
    end

    def give_turn_to(player)
        while !@is_finished && player.decide
        if player.score > MAX
            if player == @hand
                puts "You lost. Your score is higher than 21."
            elsif player == @dealer
                puts "You won. The dealer is drunk."
            end
            @is_finished = true
        end
    end
    end

    def resolution
        unless @is_finished == true
            puts "Hand score: #{@hand.score.to_s}"
            puts "Dealer score: #{@dealer.score.to_s}"
            if dealer.score > player.score
                puts "You lost. The dealer has a hand closer to 21 than yours. But try again!"
            else
                puts "You won. Your hand is closer to 21 than the dealers. Nice job!"
            end
        end
    end

    def update
        give_turn_to(@player)
        give_turn_to(@dealer)
        resolution
    end

end

binding.pry

