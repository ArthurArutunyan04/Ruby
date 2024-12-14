require 'json'
require_relative '../entities/student'
require_relative '../entities/student_short'
require_relative 'student_list_base'

class Students_list_JSON < Student_list_base
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

end
