require 'pg'
require 'date'
require_relative 'entities/student'
require_relative 'entities/student_short'
require_relative 'date/data_list_student_short'
require_relative 'student_list/student_list_db'
require_relative 'student_list/student_list'

db_params = { dbname: 'students', user: 'postgres', password: '1337', host: 'localhost', port: '5432' }
students_db = Students_list_DB.new(db_params)
student_list = Student_list.new(students_db)

new_student = Student.new(
  surname: 'Иванов',
  name: 'Иван',
  patronymic: 'Иванович',
  phone: '+77777777777',
  telegram: '@ivanov',
  email: 'ivanov@mail.com',
  git: 'https://github.com/ivanov',
  date_birth: '2000-01-01'
)

students_db.add_student(new_student)

student = student_list.find_by_id(1)
puts student.to_s if student

# students_lists = student_list.get_k_n_student_short_list(k: 3, n: 5)
# puts students_lists

# new_student_data = Student.new(
#   surname: 'Петров',
#   name: 'Петр',
#   patronymic: 'Петрович',
#   phone: '+11187654321',
#   telegram: '@petrov',
#   email: 'petrov@mail.com',
#   git: 'https://github.com/petrov',
#   date_birth: '1999-02-02'
# )
#
# student_list.replace_student_by_id(1, new_student_data)

# students_db.delete_student_by_id(1)

puts "Количество студентов: #{student_list.get_student_short_count}"


find_student = student_list.find_by_id(22)

puts "Найденый студент: #{find_student}"

