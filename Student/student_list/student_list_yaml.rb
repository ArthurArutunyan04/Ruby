require 'yaml'
require_relative 'student_list_strategy'

class Students_list_YAML < Student_list_strategy
  def read_from_file(file_path)
    return [] unless File.exist?(file_path)

    file_content = File.read(file_path)
    student_data = YAML.load(file_content, symbolize_names: true)

    students = student_data.map { |student| Student.new(**student) }

    students.each_with_object([]) do |student, unique_students|
      unique_students << student unless unique_students.any? { |existing| existing == student }
    end
  end

  def write_to_file(file_path, students)
    unique_students = students.uniq

    File.open(file_path, 'w') do |file|
      file.write(YAML.dump(unique_students.map(&:to_h)))
    end
  end
end
