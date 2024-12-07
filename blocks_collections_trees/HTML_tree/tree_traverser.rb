class TreeTraverser
  include Enumerable
  include Comparable

  def <=>(other)
    return nil unless other.is_a?(Tag)

    if self.children_count > other.children_count
      return -1
    elsif self.children_count < other.children_count
      return 1
    else
      return 0
    end
  end

  def initialize(root)
    @root = root
  end

  def BFS
    queue = [@root]
    while queue.any?
      node = queue.shift
      yield node
      node.children.each { |child| queue.push(child) }
    end
  end

  def DFS
    stack = [@root]
    while stack.any?
      node = stack.pop
      yield node
      node.children.reverse.each { |child| stack.push(child) }
    end
  end

  def each(&block)
    DFS(&block)
  end

  def children_count
    @root.children.size
  end
end
