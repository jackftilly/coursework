require "card"

describe Card do

  let(:card) { Card.new("A", "S")}

  describe "#initialize" do
    it "sets a value" do
      expect(card.value).to eq("A")
    end

    it "sets a suit" do
      expect(card.suit).to eq("S")
    end
  end

end
