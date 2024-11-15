require_relative 'tag'

class TreeTraverser
  include Enumerable

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
end
