class Data_list
  attr_reader :elements
  private :elements

  def initialize(elements)
    self.elements = elements.freeze
  end

  def elements=(new_elements)
    @elements = new_elements
  end

  def select(number)
    self.elements[number]
  end

  def get_selected(ids)
    selected_elements = []

    ids.each do |id|
      if id >= 0 && id < self.elements.size
        selected_elements << self.elements[id]
      end
    end

    selected_elements.join(", ")
  end

  def get_names
    raise NotImplementedError, "Должно быть переопределено в наследнике"
  end

  def get_data
    column_names = get_names
    get_names_attributes_values_data_table(column_names)
  end

  def get_names_attributes_values_data_table(column_names)
    table_data = []
    self.elements.each_with_index do |element, index|
      row = [index +
      column_names.each do |name|
        row << element.instance_variable_get("@#{name}")
      end
      table_data << row
    end

    Data_table.new(table_data)
  end
  private :get_names_attributes_values_data_table

  def to_s
    self.elements.join(", ")
  end
end