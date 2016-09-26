require_relative '00_tree_node'
class KnightPathFinder
  attr_accessor :nodes
    MOVES = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
  def initialize(pos)
    @start = pos
    @finish = []
    @paths = []
    @visited_positions = []
    @nodes = []
    @queue = [PolyTreeNode.new(pos)]
  end

  def valid_moves(pos)
    moves = []
    MOVES.each do |delta|
      dx, dy = delta
      x,y = pos
      if (x+dx).between?(0,7) && (y+dy).between?(0,7)
        moves << [x+dx,y+dy]
      end
    end
    moves
  end

  def new_move_positions(pos)
    new_moves = valid_moves(pos) - @visited_positions
    @visited_positions += new_moves
    new_moves
  end


  def build_move_tree
    until @queue.empty?
      current_node = @queue.shift
      @nodes << current_node
      next_steps = new_move_positions(current_node.value)
      next_steps.each do |x|
        new_node = PolyTreeNode.new(x)
        current_node.add_child(new_node)
        @queue << new_node
      end
    end
  end

  def find_path(end_pos)
    paths = []
    end_node = @nodes.select{|x|x.value == end_pos}
    print "end node lenghts #{end_node.length}"
    puts
    print "end node class #{end_node.class}"
    puts
    end_node.each do |node|
      print "node #{node.value}"
      puts
      path = []
      until node.parent == nil
        path << node.value
        node = node.parent
      end
      path << node.value
      paths = path.reverse
    end
    paths
  end

end

kpf = KnightPathFinder.new([0,0])
kpf.build_move_tree
print kpf.find_path([7,6])
