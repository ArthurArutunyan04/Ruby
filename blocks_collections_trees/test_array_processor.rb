require 'minitest/autorun'
require_relative 'array_processor.rb'

class ArrayTests < Minitest::Test

  def setup
    @array_processor = Array_processor.new([1, 2, 3, 4, 5])
  end

  def test_any_without_block
    assert(@array_processor.any? == true)
    empty_processor = Array_processor.new([])
    assert(empty_processor.any? == false)
  end

  def test_any_with_block
    assert(@array_processor.any? { |x| x > 3 } == true)
    assert(@array_processor.any? { |x| x > 5 } == false)
  end

  def test_find_index
    assert(@array_processor.find_index { |x| x == 3 } == 2)
    assert(@array_processor.find_index { |x| x == 6 } == nil)
  end

  def test_none_without_block
    assert(@array_processor.none? == false)
    empty_processor = Array_processor.new([])
    assert(empty_processor.none? == true)
  end

  def test_none_with_block
    assert(@array_processor.none? { |x| x > 5 } == true)
    assert(@array_processor.none? { |x| x < 3 } == false)
  end

  def test_reduce_with_initial
    result = @array_processor.reduce(10) { |sum, n| sum + n }
    assert(result == 25)
  end

  def test_reduce_without_initial
    result = @array_processor.reduce { |sum, n| sum + n }
    assert(result == 15)
  end

  def test_min_max
    result = @array_processor.min_max { |a, b| a <=> b }
    assert(result == [1, 5])
  end

  def test_find_all
    result = @array_processor.find_all { |x| x.even? }
    assert(result == [2, 4])
  end

end
