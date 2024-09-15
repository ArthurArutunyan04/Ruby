def find_min(array)
  min_element = array[0]
  i = 1
  while i < array.length
    if array[i] < min_element
      min_element = array[i]
    end
    i += 1
  end
  min_element
end


def elements(array)
  elements = []
  i = 0
  while i < array.length
    elements << array[i]
    i += 1
  end
  elements
end


def first_positive_index(array)
  index = -1
  i = 0
  while i < array.length
    if array[i] > 0
      index = i
      break
    end
    i += 1
  end
  index
end



print "Введите количество элементов массива:"
n = gets.chomp.to_i
array = []
puts "Введите #{n} элементов массива:"
i = 0
while i < n
    array << gets.chomp.to_i
    i += 1
end

min_el = find_min(array)
puts "Минимальный элемент: #{min_el}"c
puts "Элементы массива: #{elements(array)}"
first_pos_index = first_positive_index(array)
puts "Индекс первого положительного элемента: #{first_pos_index}"
 


