require 'player'

describe Player do

  let(:player) { Player.new }
  # let(:card) { double("card", :value => "4", :suit => "D") }
  describe "#initialize" do
    it "creates a pot value" do
      expect(player.pot).to eq(1000)
    end
  end

  describe "#receive_hand" do
    it "gives player a hand of 5 cards" do
      cards = [["2", "D"], ["J", "S"], ["7", "H"], ["A", "S"], ["9", "C"]]
      player.receive_hand(cards)
      expect(player.hand.size).to eq(5)
    end
  end

  describe "#bet_in_game" do
    it "takes money from the pot" do
      player.bet_in_game(40)
      expect(player.pot).to eq(960)
    end

    it "adds money to current game pot" do
      player.bet_in_game(40)
      expect(player.current_game_pot).to eq(60)
    end
  end

  describe "#fold!" do
    it "removes the player from the current game" do
      player.fold!
      expect(player.active).to be false
    end
  end
  #hard to test call and raise methods because they are totally user input related

  describe "#discard" do
    it "removes a user inputted amount of cards" do
      cards = [["2", "D"], ["J", "S"], ["7", "H"], ["A", "S"], ["9", "C"]]
      player.receive_hand(cards)
      player.discard([0,1])
      expect(player.hand.size).to eq(3)
    end
  end
end
