require 'json'
require_relative '../entities/student'

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
end

 
