require_relative 'student_list_interface'
require_relative 'student_list_base'

class Student_list_base_adapter < Student_list_interface
  attr_accessor :adapter
  private :adapter
  def initialize(student_list_base)
    self.adapter = student_list_base
  end

  def find_by_id(id)
    self.adapter.find { |student| student.id.to_s == id.to_s }
  end

  def get_k_n_student_short_list(k:, n:, data_list: nil)
    self.adapter.get_k_n_student_short_list(k:, n:, data_list: nil)
  end

  def sort_by_initials
    self.adapter.sort_by_initials
  end

  def new_id
    self.adapter.new_id
  end

  def add_student(student)
    self.adapter.add_student(student)
    self.adapter.write_to_file
  end

  def replace_student_by_id(id, new_student)
    self.adapter.replace_student_by_id(id, new_student)
    self.adapter.write_to_file
  end

  def delete_student_by_id(id)
    self.adapter.delete_student_by_id(id)
    self.adapter.write_to_file
  end

  def get_student_short_count
    self.adapter.get_student_short_count
  end
end
