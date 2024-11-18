class Data_table
  attr_accessor :data
  private :data

  def initialize(data)
    self.data = data
  end

  def get_element(row, column)
    self.data[row][column]
  end

  def get_count_row
    self.data.size
  end

  def get_count_column
    self.data[0].size
    end

  def to_s
    self.data.map {|row| row.join("\t")}.join("\n")
  end

end