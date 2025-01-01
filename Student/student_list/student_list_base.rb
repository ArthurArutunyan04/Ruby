require_relative '../entities/student'
require_relative '../entities/student_short'
require_relative 'student_list_interface'

class Student_list_base < Student_list_interface
  def initialize(file_path, strategy)
    @file_path = file_path
    @strategy = strategy
    @students = strategy.read_from_file(file_path)
  end

  def write_to_file
    unique_students = @students.each_with_object([]) do |student, unique_students|
      unique_students << student unless unique_students.any? { |existing| existing == student }
    end

    @strategy.write_to_file(@file_path, unique_students)
  end

  def find_by_id(id)
    @students.find { |student| student.id.to_s == id.to_s }
  end

  def get_k_n_student_short_list(k:, n:, data_list: nil)
    array_student_short = @students.map { |student| Student_short.from_student(student) }

    start_index = (k - 1) * n
    end_index = [start_index + n - 1, array_student_short.size - 1].min

    data_list = Data_list_student_short.new(array_student_short[start_index..end_index])

    data_list
  end

  def sort_by_initials
    @students.sort_by! { |student| student.initials }
  end

  def new_id
    @students.empty? ? 1 : @students.map(&:id).map(&:to_i).max + 1
  end

  def add_student(student)
    if @students.any? { |existing_student| existing_student == student }
      raise ArgumentError, "Попытка добавить дублирующегося студента: #{student.inspect}"
    end

    student.id = new_id.to_s
    @students << student
    @strategy.write_to_file(@file_path, @students)
  end

  def replace_student_by_id(id, new_student)
    index = @students.find_index { |student| student.id.to_s == id.to_s }
    if index
      unless @students.any? { |existing| existing == new_student }
        @students[index] = new_student
        new_student.id = id
        write_to_file
      end
    else
      raise "Студент с ID #{id} не найден."
    end
  end


  def delete_student_by_id(id)
    student = find_by_id(id)
    if student
      @students.delete_if { |student| student.id.to_s == id.to_s }
      @strategy.write_to_file(@file_path, @students)
    else
      raise "Студент с ID #{id} не найден."
    end
  end

  def get_student_short_count
    @students.size
  end
end
