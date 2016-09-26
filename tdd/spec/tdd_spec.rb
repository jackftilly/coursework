require 'tdd'

describe "#my_uniq" do
  let(:arr) { [1, 2, 1, 3, 3] }
  it "returns unique elements" do
    uniq_arr = arr.my_uniq
    expect(uniq_arr).to eq([1, 2, 3])
  end
end

describe "#two_sum" do
  let(:arr) { [-1, 0, 2, -2, 1] }
  it "returns indexs that sum to 0" do
    index_arr = arr.two_sum
    expect(index_arr).to eq([[0,4], [2,3]])
  end
end

describe "#my_transpose" do
  let(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  it "returns transposed array" do
    transposed = my_transpose(matrix)
    expect(transposed).to eq([[0,3,6], [1,4,7], [2,5,8]])
  end
end

describe "#stock_picker" do
  let(:arr) {[1, 0, 3, 1]}
  it "returns most profitable pair of days" do
    stock_days = stock_picker(arr)
    expect(stock_days).to eq([1,2])
  end
end

describe TowersOfHanoi do
  let(:game) { TowersOfHanoi.new([[3, 2, 1], [], []]) }
  describe "#initialize initializes array into game" do
    it "creates a arr variable" do
      expect(game.arr).to eq([[3, 2, 1], [], []])
    end
  end
  describe "#move" do
    it "changes array of game" do
      start = 0
      finish = 1
      game.move(start, finish)
      expect(game.arr).to eq([[3, 2],[1], []])
    end
  end

  describe "#won?" do
    it "returns true if game is over" do
      game.arr = [[], [3, 2, 1], []]
      expect(game.won?).to be true
    end
  end

end
