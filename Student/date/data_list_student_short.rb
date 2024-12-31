require_relative 'data_list'

class Data_list_student_short < Data_list
  def get_names
    ['surname_with_initials', 'contact', 'git']
  end

end