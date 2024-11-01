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

  def none?
    if !block_given?
      return self.array.empty?
    else
      self.array.each do |element|
        if yield(element)
          return false
        end
      end
    end
    true
  end


  def to_s
    self.array.join(', ')
  end
end

processor = Array_processor.new([1, 12, 63, 24 ,95, 4, 77])
puts processor
puts processor.any? {|element| element < 0}
puts processor.find_index {|element| element == 63}
puts processor.none?
puts processor.none?{|element| element > 1111}
