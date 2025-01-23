require 'date'
require_relative '../entities/student'
require_relative '../entities/student_short'
require_relative '../date/data_list_student_short'
require_relative '../database/db_manager'

class Student_list_DB
  def initialize(db_params)
    @db_manager = DB_manager.instance(db_params)
  end

  def find_by_id(id)
    result = @db_manager.exec_query("SELECT * FROM student WHERE id = #{id}")
    return nil if result.ntuples == 0
    student_data = result[0]
    Student.new(
      surname: student_data['surname'],
      name: student_data['name'],
      patronymic: student_data['patronymic'],
      id: student_data['id'],
      phone: student_data['phone'],
      telegram: student_data['telegram'],
      email: student_data['email'],
      git: student_data['git'],
      date_birth: student_data['date_birth']
    )
  end

  def get_k_n_student_short_list(k:, n:, data_list: nil)
    offset = (k - 1) * n

    result = @db_manager.exec_query("SELECT * FROM student ORDER BY surname, name LIMIT #{n} OFFSET #{offset}")

    students = result.map do |row|
      Student.new(
        surname: row['surname'],
        name: row['name'],
        patronymic: row['patronymic'],
        id: row['id'],
        phone: row['phone'],
        telegram: row['telegram'],
        email: row['email'],
        git: row['git'],
        date_birth: row['date_birth']
      )
    end

    array_student_short = students.map { |student| Student_short.from_student(student) }

    start_index = (k - 1) * n
    end_index = [start_index + n - 1, array_student_short.size - 1].min

    if data_list
      data_list.elements = array_student_short[start_index..end_index]
    else
      data_list = Data_list_student_short.new(array_student_short[start_index..end_index])
    end

    data_list
  end

  def add_student(student)
    @db_manager.exec_query("INSERT INTO student (surname, name, patronymic, phone_number, telegram, email, git, date_birth)
                VALUES ('#{student.surname}', '#{student.name}', '#{student.patronymic}', '#{student.phone}',
                        '#{student.telegram}', '#{student.email}', '#{student.git}', '#{student.date_birth}')")
  end

  def replace_student_by_id(id, new_student)
    @db_manager.exec_query("UPDATE student SET surname = '#{new_student.surname}', name = '#{new_student.name}',
                patronymic = '#{new_student.patronymic}', phone_number = '#{new_student.phone}', telegram = '#{new_student.telegram}',
                email = '#{new_student.email}', git = '#{new_student.git}', date_birth = '#{new_student.date_birth}'
                WHERE id = #{id}")
  end

  def delete_student_by_id(id)
    @db_manager.exec_query("DELETE FROM student WHERE id = #{id}")
  end

  def get_student_short_count
    result = @db_manager.exec_query("SELECT COUNT(*) FROM student")
    result.getvalue(0, 0).to_i
  end

  def sort_by_surname_and_initials
    result = @db_manager.exec_query("SELECT * FROM student ORDER BY surname, name, patronymic")

    students = result.map do |row|
      Student.new(
        surname: row['surname'],
        name: row['name'],
        patronymic: row['patronymic'],
        id: row['id'],
        phone: row['phone'],
        telegram: row['telegram'],
        email: row['email'],
        git: row['git'],
        date_birth: row['date_birth']
      )
    end

    student_shorts = students.map { |student| Student_short.from_student(student) }

    Data_list_student_short.new(student_shorts)
  end


  def close
    puts "ds"
    @db_manager.close
  end
end
