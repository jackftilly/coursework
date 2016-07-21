require_relative 'card'
class Hand
  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  attr_accessor :cards, :high_card

  def initialize(cards)
    @cards = cards
    @high_card = get_high_card(cards)

  end

  def value
    if straight_flush[0]
      return straight_flush[1..2]
    elsif four_of_a_kind[0]
      return four_of_a_kind[1..2]
    elsif full_house[0]
      return full_house[1..2]
    elsif flush[0]
      return flush[1..2]
    elsif straight[0]
      return straight[1..2]
    elsif three_of_a_kind[0]
      return three_of_a_kind[1..2]
    elsif pairs[0]
      return pairs[1..2]
    else
      return [1, @high_card.value]
    end
  end

  def pairs
    value = 0
    high_card = Card.new("2", "H")
    counter = 0

    @cards.each_with_index do |card, idx|
      @cards.each_with_index do |card2, idx2|
        if card.value == card2.value && idx > idx2
          value = 2
          high_card = get_high_card([card, high_card])
          counter += 1
        end
      end
    end
    if counter == 0
      return [false, counter, high_card]
    end
     [true, counter+1, high_card.value]
  end

  def three_of_a_kind
    value = 0
    high_card = nil
    @cards.each_with_index do |card, idx|
      @cards.each_with_index do |card2, idx2|
        @cards.each_with_index do |card3, idx3|
          if card.value == card2.value && idx > idx2
            if card2.value == card3.value && idx2 > idx3
              value = 4
              high_card = card
            end
          end
        end
      end
    end
    if value == 0
      return [false, value, high_card]
    end
   [true, value, high_card.value]
  end

require "byebug"
  def straight
    values = []
    cards.each do |card|
      values << card.value
    end
    values.map! do |card|
      case card
      when "A"
        card = 14
      when "K"
        card = 13
      when "Q"
        card = 12
      when "J"
        card = 11
      when "10"
        card = 10
      else
        card = card.ord - 48
      end
    end
    values.sort!

    lowest_value = values[0]
    straight = [lowest_value]
    4.times do
      straight << (straight.last + 1)
    end

    if values == straight
      return [true, 5, @high_card.value]
    end

    [false, 0, nil]
  end

  def flush
    suit = cards[0].suit
    if @cards.all? { |card| card.suit == suit }
      return [true, 6, @high_card.value]
    else
      return [false, 0, nil]
    end
  end

  def full_house
    value = 0
    high_card = nil

    if three_of_a_kind[0] && pairs[0] && (three_of_a_kind[2] != pairs[2])
      value = 7
      high_card = get_high_card(cards)
      return [true, value, high_card.value]
    end
    [false, value, high_card]
  end

  def four_of_a_kind
    value = 0
    high_card = nil
    @cards.each_with_index do |card, idx|
      @cards.each_with_index do |card2, idx2|
        @cards.each_with_index do |card3, idx3|
          @cards.each_with_index do |card4, idx4|
            if card.value == card2.value && idx > idx2
              if card2.value == card3.value && idx2 > idx3
                if card3.value == card4.value && idx3 > idx4
                  value = 8
                  high_card = card
                end
              end
            end
          end
        end
      end
    end
    if value == 0
      return [false, value, high_card]
    end
   [true, value, high_card.value]
  end

  def straight_flush
    if flush[0] && straight[0]
      return [true, 9, @high_card.value]
    end
    [false, 0, nil]
  end



  def get_high_card(cards)
    high = Card.new("2", "H")
    cards.each do |card|
      if card.value == "A"
        high = card
      elsif card.value == "K" && high.value != "A"
        high = card
      else
        if card.value.ord > high.value.ord && (high.value != "K" && high.value != "A")
          high = card
        end
      end
    end
    high
  end

def dup(array)

  dup = []

  array.each do |card|
    dup << card.dup
  end
  dup
end


end
