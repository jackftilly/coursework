require 'deck'

describe Deck do

  let(:deck) { Deck.new }
  # let(:card) { double("card", :value => "4", :suit => "D") }
  describe "#initialize" do
    it "creates 52 cards" do
      expect(deck.cards.size).to eq(52)
    end
  end

  describe "#deal" do
    it "deals cards to the players when inputted a number of cards" do
      expect(deck.deal.size).to eq(5)
    end
  end

end
