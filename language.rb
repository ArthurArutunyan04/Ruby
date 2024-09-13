# Получает имя пользователя из аргументов программы
name = ARGV[0]

puts "Привет, #{name}!" # Форматирование строки с именем пользователя

puts "Какой язык программирования? "
language = $stdin.gets.chomp # Считывает строку из стандартного ввода и удаляет символ новой строки

case language.downcase  # Приводит введенный язык к нижнему регистру
when "ruby"
  puts "Подлиза!"
when "java"
  puts "Норм, скоро будет ruby."
when "python"
  puts "Ок, скоро будет ruby."
when "c++"
  puts "Сильно, скоро будет ruby."
else
  puts "#{language}? Скоро будет ruby!"
end
