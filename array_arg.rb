def method_1(arr)
  arr.max
end

def method_2(arr)
  arr.min
end

def method_3(arr)
  arr.sum
end

def method_4(arr)
  arr.sort
end

method_number = ARGV[0].to_i
file_path = ARGV[1]

puts "Номера методов:\n1 - максимальное значение \n2 - минимальное значение \n3 - сумма элементов \n4 - сортировка"

begin
  array = File.read(file_path).split(',').map(&:to_i)
  result = case method_number
           when 1 then method_1(array)
           when 2 then method_2(array)
           when 3 then method_3(array)
           when 4 then method_4(array)
           when 5 then method_5(array)
           else
             puts "Неверный номер метода."
             result = nil
           end

  if result
    if method_number == 5
      puts "Результат: #{result.join(', ')}"  # Для сортировки, выводим отсортированный массив
    else
      puts "Результат: #{result}"
    end
  end
end
