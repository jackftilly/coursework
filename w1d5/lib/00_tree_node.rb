class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
    @queue = [self]
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
    if @parent.nil?
      add_parent(node)
    else
      replace_parent(node)
    end
  end

  def add_parent(node)
    if node.class == PolyTreeNode
      @parent = node
      node.children << self unless node.children.include?(self)
    elsif node.nil?
      @parent = node
    else
      return "argument passed is not a PolyTreeNode or nil"
    end

  end

  def replace_parent(node)
    @parent.children.delete(self)
    @parent = node
    node.children << self unless node.nil? || node.children.include?(self)
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "ERROR" unless self.children.include?(node)
    node.parent = nil
    @children.delete(node)
  end


  def dfs(val)
    return self if self.value == val
    unless self.children.empty?
      self.children.each do |node|
        a = node.dfs(val)
        return a unless a.nil?
      end
    end
    nil
  end

  def bfs(val)
    until @queue.empty?
      current_node = @queue.shift
      if current_node.value == val
        return current_node
      else
        @queue += current_node.children
      end
    end
  end


end
