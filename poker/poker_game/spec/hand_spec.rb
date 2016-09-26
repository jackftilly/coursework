require 'hand'

describe Hand do
  let(:hand) { Hand.new([Card.new("10", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("9", "H")]) }
  # let(:card) { double("card", :value => "4", :suit => "D") }
  describe "#value" do
    it "can return highest hand value from hand" do

      expect(hand.value).to eq([5, "Q"])
    end
  end
  describe "#high_card" do
    it "returns the correct high card" do

      expect(hand.high_card.value).to eq("Q")
    end
  end

  describe "#pairs" do
    it "returns a nil value if there is not a pair" do
      expect(hand.pairs[1]).to eq(0)
    end

    it "returns a value 2 if there is a pair" do
      hand = Hand.new([Card.new("10", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.pairs).to eq([true, 2, "J"])
    end

    it "returns the value 3 if there is two pairs" do
      hand = Hand.new([Card.new("Q", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.pairs).to eq([true, 3, "Q"])
    end

  end

  describe "#three_of_a_kind" do
    it "returns a nil value if there is not a three of a kind" do
      expect(hand.three_of_a_kind[1]).to eq(0)
    end

    it "returns a value 2 if there is a pair" do
      hand = Hand.new([Card.new("J", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.three_of_a_kind).to eq([true, 4, "J"])
    end


  end

  describe "#full_house" do
    it "returns a nil value if there is not a full house" do
      hand = Hand.new([Card.new("J", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.full_house).to eq([false, 0, nil])
    end
    it "returns a value of 7 when there is a full house " do
      hand = Hand.new([Card.new("J", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("Q", "C"), Card.new("J", "H")])
      expect(hand.full_house).to eq([true, 7, "Q"])
    end
  end

  describe "#four_of_a_kind" do
    it "returns a nil value if there is not four of a kind" do
      hand = Hand.new([Card.new("J", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.four_of_a_kind[1]).to eq(0)
    end

    it "returns a value 8 if there is a pair" do
      hand = Hand.new([Card.new("J", "H"), Card.new("J", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.four_of_a_kind).to eq([true, 8, "J"])
    end
  end
  describe "#flush" do
    it "returns a value of 0 if there is not a flush" do
      hand = Hand.new([Card.new("J", "H"), Card.new("J", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.flush[1]).to eq(0)
    end

    it "returns a value of 6 if there is a flush" do
      hand = Hand.new([Card.new("J", "H"), Card.new("J", "H"), Card.new("J", "H"), Card.new("8", "H"), Card.new("J", "H")])
      expect(hand.flush).to eq([true, 6, "J"])
    end
  end

  describe "#straight" do
    it "returns a value of 0 if there is not a straight" do
      hand = Hand.new([Card.new("J", "H"), Card.new("J", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.straight[1]).to eq(0)
    end

    it "returns a value of 5 if there is a straight" do
      hand = Hand.new([Card.new("10", "H"), Card.new("Q", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("9", "H")])
      expect(hand.straight).to eq([true, 5, "Q"])
    end
  end

  describe "#straight_flush" do
    it "returns a value of 0 if there is not a straight_flush" do
      hand = Hand.new([Card.new("J", "H"), Card.new("J", "D"), Card.new("J", "S"), Card.new("8", "C"), Card.new("J", "H")])
      expect(hand.straight_flush[1]).to eq(0)
    end

    it "returns a value of 9 if there is a straight_flush" do
      hand = Hand.new([Card.new("10", "D"), Card.new("Q", "D"), Card.new("J", "D"), Card.new("8", "D"), Card.new("9", "D")])
      expect(hand.straight_flush).to eq([true, 9, "Q"])
    end
  end

end
