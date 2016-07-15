require_relative 'board'
require_relative 'player'
require 'byebug'

class Minesweeper
  attr_accessor :game_board, :visible_board

  def initialize
    @game_board = GameBoard.new
    @visible_board = PlayerBoard.new
  end

  def play
    until over?
      pos = get_move
      @visible_board.render
    end
  end

  def get_move
    print "Press f for flag or r for reveal: "
    move = gets.chomp
    if move == 'f'
      print "Enter position to flag (x,y)"
      pos = gets.chomp
      pos = parse_pos(pos)
      x, y = pos
      flag(x,y)
    elsif move == 'r'
      print "Enter position to reveal(x, y): "
      pos = gets.chomp
      pos = parse_pos(pos)
      x, y = pos
      check_position(x, y)
    else
      puts "invalid choice, try again"
      get_move
    end
  end

  def flag(x,y)
    if @visible_board.grid[x][y] == "F"
      @visible_board.grid[x][y] = "_"
    else
      @visible_board.grid[x][y] = "F"
    end
  end

  def parse_pos(pos)
    pos.split("")
    pos = pos[0].to_i, pos[-1].to_i
    p pos
    pos.reverse!
    return pos
  end

  def over?
    total_blanks = 0
    total_left = 0
    #WIN CONDITION
    @visible_board.grid.each do |row|
      row.each do |item|
        if item == "_" || item == "F"
          total_blanks += 1
        elsif item == "B"
            puts "you hit a bomb, you lose!"
          return true
        end
      end
    end
    if total_blanks == 10
      return true
    else
      return false
    end

  end

  def check_position(x, y)
    x = x.abs
    y = y.abs
    @visible_board.reveal(x, y, @game_board.show_spot(x, y))
    if @game_board.show_spot(x, y) == 0

      if y != 8 && (@visible_board.grid[x][y + 1] == "_")
        @visible_board.reveal(x, y + 1, @game_board.show_spot(x, y + 1))
        if @game_board.grid[x][y + 1] == 0
          check_position(x, y + 1)
        end
        # byebug
      end
      if y != 0 && (@visible_board.grid[x][y - 1] == "_")
        @visible_board.reveal(x, y - 1, @game_board.show_spot(x, y - 1))
        if @game_board.grid[x][y - 1] == 0
          check_position(x, y - 1)
        end
        # byebug
      end

      if x != 8 && (@visible_board.grid[x + 1][y] == "_")
        @visible_board.reveal(x + 1, y, @game_board.show_spot(x + 1, y))
        if @game_board.grid[x + 1][y] == 0
          check_position(x + 1, y)
        end
        # byebug
      end

      if x != 0 && (@visible_board.grid[x - 1][y] == "_")
        @visible_board.reveal(x - 1, y, @game_board.show_spot(x - 1, y))
        if @game_board.grid[x - 1][y] == 0
          check_position(x - 1, y)
        # byebug
        end
      end

      if (y != 8 && x != 8) && (@visible_board.grid[x + 1][y + 1] == "_")
        @visible_board.reveal(x + 1, y + 1, @game_board.show_spot(x + 1, y + 1))
        if @game_board.grid[x + 1][y + 1] == 0
          check_position(x + 1, y + 1)
        end
        # byebug
      end

      if (y != 0 && x != 0) && (@visible_board.grid[x - 1][y - 1] == "_")
        @visible_board.reveal(x - 1, y - 1, @game_board.show_spot(x - 1, y - 1))
        if @game_board.grid[x - 1][y - 1] == 0
          check_position(x - 1, y - 1)
        end
        # byebug
      end

      if (y != 0 && x != 8) && (@visible_board.grid[x + 1][y - 1] == "_")
        @visible_board.reveal(x + 1, y - 1, @game_board.show_spot(x + 1, y - 1))
        if @game_board.grid[x + 1][y - 1] == 0
          check_position(x + 1, y - 1)
        end
        # byebug
      end

      if (y != 8 && x != 0) && (@visible_board.grid[x - 1][y + 1] == "_")
        @visible_board.reveal(x - 1, y + 1, @game_board.show_spot(x - 1, y + 1))
        if @game_board.grid[x - 1][y + 1] == 0
          check_position(x - 1, y + 1)
        # byebug
        end
      end
    else
      # byebug
      return @game_board.show_spot(x, y)
    end
  end
end
