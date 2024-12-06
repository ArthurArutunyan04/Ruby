require_relative 'student'
require 'date'

class Node
  include Comparable

  attr_accessor :info, :left, :right

  def initialize(info:, left: nil, right: nil)
    self.info = info
    self.left = left
    self.right = right
  end


  def <=>(other)
    return nil unless other.is_a?(Node)
    self.info.date_birth <=> other.info.date_birth
  end

end
