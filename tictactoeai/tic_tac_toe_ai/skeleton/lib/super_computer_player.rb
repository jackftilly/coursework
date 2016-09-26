require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board,mark)
    node.children.each
    winning_moves = []
    losing_moves = []
    node.children.each do |x|
      if x.winning_node?(mark) && x.board.winner == mark
        winning_moves = x.prev_move_pos
        break
      elsif x.winning_node?(mark)
        winning_moves << x.prev_move_pos
      end
    end

    node.children.each do |x|
      if x.losing_node?(mark)
        losing_moves << x.prev_move_pos
      end
    end

    winning_moves - losing_moves

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
