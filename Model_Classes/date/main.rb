require_relative 'data_table'
require_relative 'data_list'

data = [
  [1,2, "ДА"],
  [false, 14, "text"]
]
data_matrix = Data_table.new(data)
puts data_matrix

puts data_matrix.get_count_row
puts data_matrix.get_count_column
puts data_matrix.get_element(1,1)

data_list = Data_list.new([7, 1, 4, 5, 2, 8])
puts data_list