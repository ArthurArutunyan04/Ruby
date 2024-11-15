require_relative 'student'
require_relative 'student_tree'

students = [
  Student.new(date_birth: '1995-03-10', surname: 'Нагиев', name: 'Дмитрий', patronymic: 'Владимирович'),
  Student.new(date_birth: '1990-05-15', surname: 'Стейтем', name: 'Джейснон', patronymic: 'Барри'),
  Student.new(date_birth: '1998-02-01', surname: 'Валери', name: 'Винсент', patronymic: 'Ви'),
  Student.new(date_birth: '1994-11-30', surname: 'Адейеми', name: 'Джейми', patronymic: 'Феникс'),
  Student.new(date_birth: '1993-07-21', surname: 'Дизель', name: 'Вин', patronymic: 'Винсент'),
  Student.new(date_birth: '2001-01-01', surname: 'Джинкс', name: 'Паудер', patronymic: 'Вандер'),
  Student.new(date_birth: '1996-05-12', surname: 'Инвокер', name: 'Кель', patronymic: 'Каель'),
]

tree = StudentTree.new
students.each { |student| tree.add_student(student) }
puts tree

puts "Студенты старше 1995 года:"
old_students = tree.select { |student| student.date_birth < Date.new(1995, 1, 1) }
old_students.each { |student| puts student.get_info_for_tree }

puts "Именя студентов:"
names = tree.map { |student| student.name }
puts names

puts "Младший и старший студенты:"
students = tree.minmax
students.each{ |student| puts student.get_info_for_tree }