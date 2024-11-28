require_relative 'data_table'
require_relative 'data_list'
require_relative 'data_list_student_short'
require_relative '../entities/student'
require_relative '../entities/student_short'

data = [
  [1,2, "Текст"],
  [false, 14, "text"]
]
data_matrix = Data_table.new(data)
puts data_matrix

puts data_matrix.get_count_row
puts data_matrix.get_count_column
puts data_matrix.get_element(1,1)

data_list = Data_list.new([7, 1, 4, 5, 2, 8])
puts data_list

puts data_list.select(3)
puts data_list.get_selected([1,5,2])

student1 = Student.new(surname: "Иванов", name: "Иван", patronymic: "Иваныч", phone: "+71234567890")
student2 = Student.new(surname: "Фомилия", name: "Имя", patronymic: "Очество", telegram: "@NoName", email: "Anonimus46@mail.com")

student_shorts = [
  student_short1 = Student_short.from_student(student1),
  student_short2 = Student_short.from_student(student2)
]

data_list_students  = Data_list_student_short.new(student_shorts)

puts data_list_students.get_names.join(" | ")
puts data_list_students.get_data
