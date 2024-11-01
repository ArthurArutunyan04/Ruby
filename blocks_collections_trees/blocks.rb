def count_elements_after_last_max(array)
  max_index = array.rindex(yield(array))
  array[max_index + 1..-1].size
end

def max_element(array)
  array.max
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
  puts "6. Выход."

  task_choice = gets.chomp.to_i
  case task_choice
  when 1
    count = count_elements_after_last_max(array) { max_element(array) }
    puts "Количество элементов после последнего максимального: #{count}"
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
