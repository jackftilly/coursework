class Game
  attr_accessor :deck, :player1, :player2, :current_player, :starting_player

  def initialize()
    @deck = Deck.new
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
    @starting_player = @player1
    @game_pot = 0
  end

  def set_game
    cards_for_player = @deck.deal
    @player1.recieve_hand(cards_for_player)
    cards_for_player = @deck.deal
    @player2.recieve_hand(cards_for_player)
  end

  def play
    until over?
      get_ante
      play_round
      update_pots
      discard_cards
      switch_starting!
    end
  end

  def get_ante
    @player1.bet_in_game(20)
    @player2.bet_in_game(20)
    @game_pot = 40
  end

  def switch_player!
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  def update_pots
    switch_player!
    if !@player1.active
      @player2.gets_money(@game_pot)
    elsif !@player2.active
      @player1.gets_money(@game_pot)
    end
    @game_pot = 0
  end

  def switch_starting!
    if @starting_player == @player1
      @starting_player = @player2
    else
      @starting_player = @player1
    end
  end

  def play_round
    set_game
    counter = 0
    to_bet = 0
    until (@player1.current_game_pot == @player2.current_game_pot) && (counter != 0)
      2.times do
        to_bet = @current_player.bet(to_bet)
        if to_bet == 0
          return
        end
        @game_pot += to_bet
        switch_player!
      end
      counter += 1
    end

    @player1.get_dispose
    @player2.get_dispose

    counter = 0
    to_bet = 0
    until (@player1.current_game_pot == @player2.current_game_pot) && (counter != 0)
      2.times do
        to_bet = @current_player.bet(to_bet)
        if to_bet == 0
          return
        end
        @game_pot += to_bet
        switch_player!
      end
      counter += 1
    end

    p1_val, p1_high_card = @player1.hand.value
    p2_val, p2_high_card = @player2.hand.value
    if p1_val > p2_val
      print "player1 wins"
      @player2.active = false
      return
    elsif p2_val > p1_val
      print "player2 wins"
      @player1.active = false
      return
    else
      if p1_high_card > p2_val
        print "player1 wins"
        @player2.active = false
        return
      elsif p2_val > p1_val
        print "player2 wins"
        @player1.active = false
        return

  end

  def discard_cards
    @player1.hand = []
    @player2.hand = []
  end
  def over?
    return true if @player1.broke? || @player2.broke?
    false
  end
end
