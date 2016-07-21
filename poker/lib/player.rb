class Player
  attr_accessor :hand, :pot, :active, :current_game_pot

  def initialize
    @hand = []
    @pot = 1000
    @current_game_pot = 0
    @active = true
  end

  def gets_money(amount)
    @pot += amount
  end

  def receive_hand(cards)
    cards.each do |card|
      @hand << card
    end
  end

  def bet_in_game(val)
    @pot -= val
    @current_game_pot += val
  end

  def discard(cards_to_discard)
    cards_to_discard.each do |index|
      @hand.delete_at(index)
    end
    puts "your hand after disposing #{hand}"
    @hand
  end

  def get_dispose
    print "Enter how many cards you want to dispose: "
    number_of_cards = gets.chomp.to_i
    disposed_cards = []
    number_of_cards.times do
      puts "your cards: #{hand}"
      print "Enter position in cards array you want to dispose(0-4): "
      dispose_position = gets.chomp.to_i
      disposed_cards << dispose_position
    end
    discard(disposed_cards)
  end

  def bet(call_amount)
    puts "Do you want to fold(f), call(c), or raise(r)?: "
    bet_input = gets.chomp
    bet_amount = 0
    if bet_input == "f"
      bet_amount = fold!
    elsif bet_input == "c"
      bet_amount = call!(call_amount)
    elsif bet_input == "r"
      bet_amount = raise!(call_amount)
    else
      raise "INVALID INPUT"
    end
    bet_amount
  end
  def fold!
    @active = false
    return 0
  end
  def call!
    bet_in_game(call_amount)
    return call_amount
  end
  def raise!
    print "Enter amount to raise: "
    raise_amount = gets.chomp.to_i
    bet_in_game(raise_amount + call_amount)
    raise_amount + call_amount
  end

  def broke?
    return true if pot == 0
    false
  end
end
