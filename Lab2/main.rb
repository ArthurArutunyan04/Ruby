require_relative 'student'

def print_student_info(student)
  puts"
  ID = #{student.id || "Пусто"}
  Surname = #{student.surname}
  Name = #{student.name}
  Patronymic = #{student.patronymic}
  Phone = #{student.phone || "Пусто"}
  Telegram = #{student.telegram || "Пусто"}
  Email = #{student.email || "Пусто"}
  Git = #{student.git || "Пусто"}
  "
end

student1 = Student.new("Сервер", "Линукс", "Бэкендович", 1, "+77777777777", nil, "Sigma228@rambler.ru", nil)
student2 = Student.new("Адидас", "Найк", "НьюБелансавич", 12, "+79234446661","NikePro", nil, "Pro100Botinok")
print_student_info(student1)
print_student_info(student2)