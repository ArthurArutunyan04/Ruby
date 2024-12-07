class Tag
  attr_accessor :name, :attributes, :children, :content

  include Comparable

  def initialize(name, attributes = {}, content = '')
    self.name = name
    self.attributes = attributes
    self.content = content
    self.children = []
  end

  def <=>(other)
    return nil unless other.is_a?(Tag)
    self.children.size <=> other.children.size
  end

  def add_child(child)
    self.children << child
  end

  def to_s
    children_names = children.map(&:name).join(', ')
    "name: #{self.name}, children: #{children_names.empty? ? 'None' : children_names}, attributes: #{self.attributes}, content: #{self.content},"
  end

  def short_info
    children_names = children.map(&:name).join(', ')
    tag_info = "name: #{self.name}, children: #{children_names.empty? ? 'None' : children_names}, has_attributes: #{has_attributes?}, children_count: #{children_count}"
  end

  def tag_name
    self.name
  end

  def has_attributes?
    !self.attributes.empty?
  end

  def children_count
    self.children.size
  end

end
