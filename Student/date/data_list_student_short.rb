require_relative 'data_list'

class Data_list_student_short < Data_list
  def get_names
    ['surname_with_initials', 'contact', 'git']
  end

  def get_data
    data = []

    self.elements.each_with_index do |student_short, index|
      row = [index + 1]

      row << student_short.surname_with_initials
      row << student_short.contact
      row << student_short.git

      data << row
    end
    Data_table.new(data)
  end

  private :get_names, :get_data

end