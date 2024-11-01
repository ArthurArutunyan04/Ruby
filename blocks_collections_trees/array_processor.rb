class Array_processor

  attr_accessor :array

  def initialize(array)
    self.array = array.freeze
  end

  private :array=

  def any?
    if !block_given?
      return !self.array.empty?
    else
      self.array.each do |element|
        if yield(element)
          return true
        end
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


  def reduce(initial = nil)
    accumulator = initial || array[0]
    start_index = initial ? 0 : 1

    self.array[start_index .. -1].each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end


  def min_max
    min = max = self.array[0]

    self.array.each do |element|
      if yield(element, min) < 0
        min = element
      end
      if yield(element, max) > 0
        max = element
      end
    end
    [min, max]
  end


  def find_all
    result = []
    
    self.array.each do |element|
      if yield(element)
        result << element
      end
    end
    result
  end


  def to_s
    self.array.join(', ')
  end

end

# processor = Array_processor.new([1, 12, 63, 24 ,95, 4, 77])
# puts processor
# puts processor.any? {|element| element < 0}
# puts processor.any?
# puts processor.find_index {|element| element == 63}
# puts processor.none?
# puts processor.none?{|element| element > 1111}
# puts processor.reduce{|accumulator, element| accumulator + element}
# puts processor.reduce(12){|accumulator, element| accumulator + element}
# puts processor.min_max{|element1, element2| element1 <=> element2}
# puts processor.find_all{|element| element.odd?}
