def max_value(arr)
  arr.max
end

def min_value(arr)
  arr.min
end

def sum_values(arr)
  arr.sum
end

def sort_array(arr)
  arr.sort
end

method_number = ARGV[0].to_i
file_path = ARGV[1]

puts "Номера методов:\n1 - максимальное значение \n2 - минимальное значение \n3 - сумма элементов \n4 - сортировка"

begin
  array = File.read(file_path).split(',').map(&:to_i)
  result = case method_number
           when 1 then max_value(array)
           when 2 then min_value(array)
           when 3 then sum_values(array)
           when 4 then sort_array(array)
           else
             puts "Неверный номер метода."
             result = nil
           end

  if result
    if method_number == 4
      puts "Результат: #{result.join(', ')}"  # Для сортировки, выводим отсортированный массив
    else
      puts "Результат: #{result}"
    end
  end
end
 
