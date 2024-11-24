def find_min(array)
  min_element = array[0]
  for i in 1...array.length
    if array[i] < min_element
      min_element = array[i]
    end
  end
  min_element
end

def elements(array)
  elements = []
  for i in 0...array.length
    elements << array[i]
  end
  elements
end

def first_positive_index(array)
  index = -1
  for i in 0...array.length
    if array[i] > 0
      index = i
      break
    end
  end
  index
end

print "Введите количество элементов массива:"
n = gets.chomp.to_i
array = []
puts "Введите #{n} элементов массива:"
  for i in 0...n
    array << gets.chomp.to_i
  end

min_el = find_min(array)
puts "Минимальный элемент: #{min_el}"
puts "Элементы массива: #{elements(array)}"
first_pos_index = first_positive_index(array)
puts "Индекс первого положительного элемента: #{first_pos_index}"
 
