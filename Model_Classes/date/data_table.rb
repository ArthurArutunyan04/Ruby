class Data_table
  attr_accessor :data
  private :data

  def initialize(data)
    self.data = data
  end

  def to_s
    self.data.map {|row| row.join("\t")}.join("\n")
  end

end