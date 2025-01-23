require_relative 'data_table'

class Data_list
  attr_accessor :elements,  :count
  private :elements, :count

  def initialize(elements)
    self.elements = elements.freeze
    @observer = []
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
      row = [index + 1]
      column_names.each do |name|
        row << element.instance_variable_get("@#{name}")
      end
      table_data << row
    end

    data_set = Data_table.new(table_data)
    data_set
  end
  private :get_names_attributes_values_data_table

  def add_observer(observer)
    @observer << observer
  end

  def notify
    @observer.each do |observer|
      observer.set_table_params(get_names, self.count)
      observer.set_table_data(get_data)
    end
  end


  def to_s
    self.elements.to_s
  end
end

