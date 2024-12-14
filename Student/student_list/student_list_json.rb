require 'json'
require_relative 'student_list_strategy'

class Students_list_JSON < Student_list_strategy
  def read_from_file(file_path)
    return [] unless File.exist?(file_path)

    file_content = File.read(file_path)
    student_data = JSON.parse(file_content, symbolize_names: true)

    student_data.map { |student| Student.new(**student) }
  end

  def write_to_file(file_path, students)
    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(students.map(&:to_h)))
    end
  end

end
