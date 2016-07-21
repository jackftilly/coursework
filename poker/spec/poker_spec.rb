require "poker"

describe Game do
  let(:game) { Game.new }
  describe "#initialize" do
    it "creates a deck and two players" do
      expect(game.deck.cards.size).to eq(52)
    end

    it "sets current_player to player1" do
      expect(game.current_player).to eq(game.player1)
    end
  end
end
