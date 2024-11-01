def count_elements_after_last_max(array)
  max_index = array.rindex(yield(array))
  count = array[max_index + 1..-1].size
  puts "Количество элементов после последнего максимального: #{count}"
end


def move_elements_before_min(array)
  min_index = array.index(yield(array))
  elements_after_min = array[min_index + 1..-1]
  elements_before_min = array[0...min_index]
  moved_array = [array[min_index]] + elements_after_min + elements_before_min
  puts "Массив после перемещения: #{moved_array.join(', ')}"
end


def max_in_range(array, a, b)
  range_elements = array.select { |element| element >= a && element <= b }
  if range_elements.empty?
    puts "Нет элементов в указанном интервале."
  else
    max_element = yield(range_elements)
    puts "Максимальный элемент в интервале: #{max_element}"
  end
end


def get_array_from_input
  puts "Введите элементы массива:"
  array = gets.chomp.split.map(&:to_i)
  print_array(array)
  array
end

def get_array_from_file(file_path)
  if file_path.nil? || file_path.empty?
    puts 'Путь к файлу не должен быть пустым.'
    return []
  end

  unless File.exist?(file_path)
    puts 'Файл не существует'
    return []
  end

  array = []
  File.open(file_path, 'r') do |file|
    array = file.read.split(' ').map(&:to_i)
  end
  print_array(array)
  array
end

def print_array(array)
  puts "Введенный массив: #{array.join(', ')}"
end

def choose_input_method
  puts "Выберите способ ввода данных:"
  puts "1. Ввод с клавиатуры"
  puts "2. Чтение из файла"
  choice = gets.chomp.to_i

  case choice
  when 1
    get_array_from_input
  when 2
    puts "Введите путь к файлу:"
    file_path = gets.chomp
    get_array_from_file(file_path)
  else
    puts "Некорректный выбор."
    []
  end
end

def choose_task(array)
  puts "Выберите задачу для решения (введите номер):"
  puts "1. Найти количество элементов после последнего максимального."
  puts "2. Переместить элементы до минимального в конец массива."
  puts "3. Найти максимальный элемент в заданном интервале."
  puts "6. Выход."

  task_choice = gets.chomp.to_i
  case task_choice
  when 1
    count_elements_after_last_max(array) { array.max }
  when 2
    move_elements_before_min(array) { array.min }
  when 3
    puts "Введите интервал (a b):"
    a, b = gets.chomp.split.map(&:to_i)
    max_in_range(array, a, b) { |arr| arr.max }
  when 6
    puts "Выход из программы."
    exit
  else
    puts "Некорректный выбор задачи."
  end
end

def main
  array = choose_input_method

  loop do
    choose_task(array)
  end
end

main