class Array_processor

  attr_accessor :array

  def initialize(array)
    self.array = array.freeze
  end

  def any?
    self.array.each do |element|
      if yield(element)
        return true
      end
    end
    false
  end

  def find_index
    index = 0
    self.array.each do |element|
      if yield(element)
        return index
      end
      index += 1
    end
    nil
  end

  def to_s
    array.join(', ')
  end
end

processor = Array_processor.new([1, 12, 63, 24 ,95, 4, 77])
puts processor
puts processor.any? {|element| element < 0}
puts processor.find_index {|element| element == 63}
