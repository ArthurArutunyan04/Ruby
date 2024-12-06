require_relative 'node'

class StudentTree
  include Enumerable

  def initialize
    @root = nil
  end


  def add_student(student)
    if @root.nil?
      @root = Node.new(info: student)
    else
      add_to_tree(@root, student)
    end
  end

  def add_to_tree(node, student)
    if student < node.info
      if node.left.nil?
        node.left = Node.new(info: student)
      else
        add_to_tree(node.left, student)
      end
    else
      if node.right.nil?
        node.right = Node.new(info: student)
      else
        add_to_tree(node.right, student)
      end
    end
  end


  def each(&block)
    block.call(@root.info) if @root
    traverse_dfs(@root.left, &block) if @root.left
    traverse_dfs(@root.right, &block) if @root.right
  end


  def to_s
    result = "Корень: #{@root.info.get_info_for_tree}\n" if @root
    result ||= "Дерево пусто\n"

    result += "Левое поддерево:\n"
    result += subtree_to_s(@root.left) if @root.left
    result += "Правое поддерево:\n"
    result += subtree_to_s(@root.right) if @root.right
    result
  end

  private

  def traverse_dfs(node = @root, &block)
    return if node.nil?

    yield node.info
    traverse_dfs(node.left, &block)
    traverse_dfs(node.right, &block)
  end


  def subtree_to_s(node)
    return "" if node.nil?

    result = "#{node.info.get_info_for_tree}\n"
    result += subtree_to_s(node.left) if node.left
    result += subtree_to_s(node.right) if node.right
    result
  end
end
