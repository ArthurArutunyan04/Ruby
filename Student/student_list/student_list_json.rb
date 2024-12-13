require 'json'
require_relative '../entities/student'
require_relative '../entities/student_short'

class Students_list_JSON
  def initialize(file_path)
    @file_path = file_path
    @students = []
    read_from_file
  end

  def read_from_file
    return unless File.exist?(@file_path)

    file_content = File.read(@file_path)
    student_data = JSON.parse(file_content, symbolize_names: true)

    @students = student_data.map do |student|
      Student.new(**student)
    end
  end

  def write_to_file
    File.open(@file_path, 'w') do |file|
      file.write(JSON.pretty_generate(@students.map(&:to_h)))
    end
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


end

