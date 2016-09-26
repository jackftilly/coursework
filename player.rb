class PlayerBoard
  attr_accessor :grid


  def initialize
    @grid = Array.new(9) { Array.new(9) { "_" } }
  end

  def check_position(pos)

  end

  def visible?(pos)
    if @grid.pos == "_"
      return false
    else
      return true
    end
  end

  def reveal(x, y, val)
    @grid[x][y] = val
  end


  def render
    inner_row = ""
    #prints board
    @grid.each do |row|
      row.each do |item|
        inner_row += item + " "
      end
      puts inner_row
      inner_row = ""
    end
  end
end
