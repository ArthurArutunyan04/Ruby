class Data_table
  attr_accessor :data
  private :data

  def initialize(data)
    self.data = data
  end

  def data
    @data
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

  def [](row)
    self.data[row]
  end
  def to_s
    self.data.to_s
  end

end
