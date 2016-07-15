require 'byebug'

class GameBoard
  attr_accessor :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) {0}}
    populate
    populate_values
  end

  def populate
    @bombs = random_bomb_pos
    @bombs.each do |bomb|
      x, y = bomb
      @grid[x][y] = 10
    end
  end

  def populate_values
    @bombs.each do |bomb|

      x, y = bomb
      puts "bomb: #{bomb}"

      grid[x][y + 1] += 1 unless y == 8
      grid[x][y - 1] += 1 unless y == 0
      grid[x + 1][y] += 1 unless x == 8
      grid[x - 1][y] += 1 unless x == 0

      grid[x + 1][y + 1] += 1 unless y == 8 || x == 8
      grid[x - 1][y - 1] += 1 unless y == 0 || x == 0
      grid[x + 1][y - 1] += 1 unless y == 0 || x == 8
      grid[x - 1][y + 1] += 1 unless y == 8 || x == 0

    end

    @bombs.each do |bomb|
      x, y = bomb
      @grid[x][y] = "B"
    end

    @grid
  end


  def random_bomb_pos
    x = rand(9)
    y = rand(9)
    bombs = [[x,y]]
    until bombs.size == 10
      x = rand(9)
      y = rand(9)
       bombs << [x, y]
      bombs.uniq!
    end
    bombs
  end


  def show_spot(x, y)
    return @grid[x][y]
  end

  private
  attr_accessor :bombs
end
