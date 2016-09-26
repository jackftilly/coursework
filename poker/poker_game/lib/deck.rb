require_relative 'card'

class Deck

  attr_accessor :cards
  CARDS = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

  def create_deck
    cards = []
    13.times do |idx|
      cards << Card.new(CARDS[idx], "D")
      cards << Card.new(CARDS[idx], "S")
      cards << Card.new(CARDS[idx], "H")
      cards << Card.new(CARDS[idx], "C")
    end
    cards.shuffle!
  end

  def initialize
    @cards = self.create_deck
  end

  def deal(num_cards = 5)
    cards_to_deal = []
    num_cards.times do
      cards_to_deal << cards.pop
    end
    cards_to_deal
  end


end
