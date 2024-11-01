class Array_processor

  attr_accessor :array

  def initialize(array)
    self.array = array.freeze
  end

  def any?
    array.each do |element|
      if yield(element)
        return true
      end
    end
    false
  end

  def to_s
    array.join(', ')
  end
end

processor = Array_processor.new([1, 12, 63, 24 ,95, 4, 77])
puts processor
puts processor.any? {|element| element < 0}