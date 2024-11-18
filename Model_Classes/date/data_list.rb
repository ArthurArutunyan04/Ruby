class Data_list
  attr_accessor :elements

  def initialize(elements)
    self.elements = elements.sort.freeze
  end

  def to_s
    self.elements.join(", ")
  end
end