class Array
  def my_uniq
    not_unique = self
    unique = []
    not_unique.each do |el|
      unique << el unless unique.include?(el)
    end
    unique
  end

  def two_sum
    original = self
    zero_sum = []
    original.each_with_index do |el, idx|
      original.each_with_index do |el2, idx2|
        if el + el2 == 0
          zero_sum << [idx, idx2] unless idx == idx2 || zero_sum.include?([idx2, idx])
        end
      end
    end
    zero_sum
  end

end

def my_transpose(array)
  transposed = Array.new(array.size) { Array.new }

  array.each do |subarray|
    # transposed[index] << index
    subarray.each_with_index do |el, idx|
      transposed[idx] << el
    end
  end

  transposed
end

def stock_picker(array)
  sell_day = 0
  sell_day_idx = 0
  buy_day = nil
  buy_day_idx = nil

  array.each_with_index do |day, indx|
    if day > sell_day
      sell_day = day
      sell_day_idx = indx
    end
  end
  (0...sell_day_idx).each_with_index do |day, index|
     if buy_day.nil? || buy_day < day
       buy_day = day
       buy_day_idx = index
     end
  end
  [buy_day_idx, sell_day_idx]
end

class TowersOfHanoi
  attr_accessor :arr
  def initialize(arr)
    @arr = arr
  end

  def move(start, final)
    if valid_move?(start, final)
      moving_piece = @arr[start].pop
      @arr[final] << moving_piece
    end
    [start, final]
  end

  def valid_move?(start, final)
    if @arr[start].empty?
      return false
    end
    unless @arr[final].empty?
      if @arr[final].last < @arr[start].last
        return false
      end
    end
    true
  end

  def get_input
    print "Move from:"
    start = gets.chomp.to_i
    print "Move to: "
    final = gets.chomp.to_i
    [start, final]
  end

  def won?
    return true if arr.include?([3, 2, 1])
    false
  end

end
