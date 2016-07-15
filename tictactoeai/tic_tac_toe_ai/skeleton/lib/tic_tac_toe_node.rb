require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  MARKS = {:x => :o, :o => :x}
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @child = []
  end

  def losing_node?(evaluator)
    if @board.winner == MARKS[evaluator] && @board.over?
      return true
    elsif @board.winner != MARKS[evaluator] && @board.over?
      return false
    end
    boolean = false
    # byebug
    if evaluator == @next_mover_mark
      children.each do |x|
        boolean = x.losing_node?(evaluator)
        if boolean
          return boolean
        end
      end
    else
      children.each do |x|
        boolean = x.losing_node?(evaluator)
        if boolean
         return boolean
        end
      end
    end
    false


  end

  def winning_node?(evaluator)
    if @board.winner == evaluator && @board.over?
      return true
    elsif @board.winner != evaluator && @board.over?
      return false
    end
    boolean = false
    if evaluator == @next_mover_mark
      children.each do |x|
        boolean = x.winning_node?(evaluator)
        if boolean
          return boolean
        end
      end
    else
      children.each do |x|
        boolean = x.winning_node?(evaluator)
        if boolean
          return boolean
        end
      end
    end
    false
  end


  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    3.times do |row|
      3.times do |col|
        if @board[[row,col]].nil?
          new_board = @board.dup
          new_board[[row,col]] = @next_mover_mark
          new_node = TicTacToeNode.new(new_board,MARKS[@next_mover_mark],[row,col])
          @child << new_node
        end
      end
    end
    @child
  end
end
