class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if node.class == PolyTreeNode
      @parent = node
      node.children << self
    else
      return "argument passed is not a PolyTreeNode"
    end
  end


end
