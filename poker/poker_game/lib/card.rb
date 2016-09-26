class Card

  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def dup
    new_card = Card.new(value, suit)
  end
end
