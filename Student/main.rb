require_relative 'student'
require_relative 'student_short'

student = Student.new(
  surname: "Иванов",
  name: "Иван",
  patronymic: "Иванович",
  id: "1",
  phone: "+71234567890",
  telegram: "@1van",
  email: "ivanov@mail.com",
  )
puts student.to_s

student.id = "2"
student.surname = "Фамилия"
student.git =  "https://github.com/ivanov"
student.set_contacts(email: "1Van0v@mail.ru")

puts student.to_s

student_sh_from_student = Student_short.from_student(student)
puts student_sh_from_student

student_sh_from_string = Student_short.from_info_string("4",student.getInfo)
puts student_sh_from_string
