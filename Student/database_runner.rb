require 'pg'
require 'date'
require_relative 'entities/student'
require_relative 'entities/student_short'
require_relative 'date/data_list_student_short'
require_relative 'student_list/student_list_db'


# connection = PG.connect(
#   dbname: 'students',
#   user: 'postgres',
#   password: '1337',
#   host: 'localhost',
#   port: 5432
# )
#
#
# query = "SELECT * FROM student WHERE date_birth > '1997-01-01';"
# result = connection.exec(query)
#
# result.each do |row|
#   puts "ID: #{row['id']}, Фамилия: #{row['surname']}, Имя: #{row['name']}, Отчество: #{row['patronymic']}, Телефон: #{row['phone_number']}, Email: #{row['email']}, Telegram: #{row['telegram']}, Git: #{row['git']}, Дата рождения: #{row['date_birth']}"
# end
#
# connection.close if connection
db_params = { dbname: 'students', user: 'postgres', password: '1337', host: 'localhost', port: '5432' }
students_db = Students_list_DB.new(db_params)

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

student = students_db.find_by_id(1)
puts student.to_s if student

students_list = students_db.get_k_n_student_short_list(k: 1, n: 5)
puts students_list

new_student_data = Student.new(
  surname: 'Петров',
  name: 'Петр',
  patronymic: 'Петрович',
  phone: '+11187654321',
  telegram: '@petrov',
  email: 'petrov@mail.com',
  git: 'https://github.com/petrov',
  date_birth: '1999-02-02'
)

students_db.replace_student_by_id(1, new_student_data)

students_db.delete_student_by_id(1)

puts "Количество студентов: #{students_db.get_student_short_count}"

students_db.close

