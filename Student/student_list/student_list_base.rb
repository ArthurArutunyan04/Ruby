require_relative '../entities/student'
require_relative '../entities/student_short'

class Student_list_base

  def initialize(file_path)
    @file_path = file_path
    @students = []
    read_from_file
  end

  def find_by_id(id)
    @students.find { |student| student.id.to_s == id.to_s }
  end

  def get_k_n_student_short_list(k:, n:, data_list: nil)

    array_student_short = @students.each_with_object([]) {|student, array| array.append(Student_short.from_student(student))}

    start_index = (k-1) * n
    end_index = [start_index + n - 1, array_student_short.size - 1].min

    data_list = Data_list_student_short.new(array_student_short[start_index..end_index])

    data_list
  end

  def sort_by_initials
    @students.sort_by!{|student| student.initials}
  end

  def new_id
    new_id = @students.empty? ? 1 : @students.map { |student| student.id.to_i }.max + 1
  end

  private :new_id

  def add_student(student)
    student.id = new_id.to_s
    @students << student
  end

  def replace_student_by_id(id, new_student)
    index = @students.find_index { |student| student.id.to_s == id.to_s }

    if index
      @students[index] = new_student
      new_student.id = id
    else
      raise "Студент с ID #{id} не найден."
    end
  end

  def delete_student_by_id(id)
    student = find_by_id(id)
    if student
      @students.delete_if { |student| student.id.to_s == id.to_s }
    else
      raise "Студент с ID #{id} не найден."
    end
  end

  def get_student_short_count
    @students.size
  end

end
