require_relative 'data_table'
require_relative 'data_list'
require_relative 'data_list_student_short'
require_relative '../entities/student'
require_relative '../entities/student_short'
require_relative '../student_list/student_list_json'
require_relative '../student_list/student_list_yaml'
require_relative '../student_list/student_list_base'
require_relative '../student_list/student_list_db'
require_relative '../student_list/student_list_base_adapter'
require_relative '../student_list/student_list'

# data = [
#   [1,2, "Текст"],
#   [false, 14, "text"]
# ]
# data_matrix = Data_table.new(data)
# puts data_matrix
#
# puts data_matrix.get_count_row
# puts data_matrix.get_count_column
# puts data_matrix.get_element(1,1)
#
# data_list = Data_list.new([7, 1, 4, 5, 2, 8])
# puts data_list
#
# puts data_list.select(3)
# puts data_list.get_selected([1,5,2])

student1 = Student.new(surname: "Иванов", name: "Иван", patronymic: "Иваныч", phone: "+71234567890")
student2 = Student.new(surname: "Фомилия", name: "Имя", patronymic: "Очество", telegram: "@NoName", email: "Anonimus46@mail.com")

student_shorts = [
  student_short1 = Student_short.from_student(student1),
  student_short2 = Student_short.from_student(student2)
]

data_list_students = Data_list_student_short.new(student_shorts)
puts data_list_students.get_data
#
# puts "=="*100

# students_list = Students_list_JSON.new('C:\Users\lartu\Ruby\Student\students.json')
# yaml_strategy = Students_list_YAML.new
# students_list = Student_list_base.new('C:\Users\lartu\Ruby\Student\students.yaml', yaml_strategy)

# json_strategy = Students_list_JSON.new
# list = Student_list_base.new('C:\Users\lartu\Ruby\Student\students.json', json_strategy)
# students_list = Student_list.new(list)
# yaml_strategy = Students_list_YAML.new
# list = Student_list_base.new('C:\Users\lartu\Ruby\Student\students.yaml', yaml_strategy)
# students_list = Student_list.new(list)

#
# puts students_list.find_by_id(2)
#
# result = students_list.get_k_n_student_short_list(k: 1, n: 4)
# puts result
#
# puts "22"
#
# new_student = Student.new(
#   surname: 'Владимиров',
#   name: 'Владимир',
#   patronymic: 'Владимирович',
#   phone: '+79129876543',
#   telegram: '@vladimirov',
#   email: 'vladimirov@mail.ru',
#   git: 'https://github.com/vladimirov',
#   date_birth: '1995-06-06'
# )
#
# students_list.add_student(new_student)


# replace_student = Student.new(
#   surname: 'Нагиев',
#   name: 'Дмитрий',
#   patronymic: 'Владимирович',
#   phone: '+77777777777',
#   telegram: '@D1mas1ck',
#   email: 'Demon123@gmail.com',
#   git: 'https://github.com/Dmitr'
# )
#
# students_list.add_student(replace_student)

# students_list.replace_student_by_id('2', replace_student)

# students_list.delete_student_by_id('1')

# puts students_list.get_student_short_count



# json_strategy = Students_list_JSON.new
# student_list = Student_list_base.new('C:/Users/lartu/Ruby/Student/students.json', json_strategy)
# student_list.read_to_file
#
#
# yaml_strategy = Students_list_YAML.new
#
# student_list.strategy = yaml_strategy
# student_list.file_path = 'C:/Users/lartu/Ruby/Student/students.yaml'
# student_list.write_to_file




#
json_strategy = Students_list_JSON.new
file_adapter = Student_list_base.new('C:\\Users\\Artur\\Ruby\\Student\\students.json', json_strategy)
file_adapter.read_to_file


puts "Из файла:"
dda = file_adapter.get_k_n_student_short_list(k: 1, n: 20)
puts dda.get_data
db_params = { dbname: 'students', user: 'postgres', password: '1337', host: 'localhost', port: '5432' }
db_adapter = Student_list_DB.new(db_params)
student_list_db = Student_list.new(db_adapter)

puts "Из бд:"
puts student_list_db.get_k_n_student_short_list(k: 1, n: 5)
db_adapter.close

#





















