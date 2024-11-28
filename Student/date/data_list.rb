class Data_list
  attr_accessor :elements

  def initialize(elements)
    self.elements = elements.sort.freeze
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
    raise NotImplementedError, "Должно быть переопределено в наследнике"
  end


  def to_s
    self.elements.join(", ")
  end
end