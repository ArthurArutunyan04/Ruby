class Student_list_strategy
  def read_from_file
    raise NotImplementedError, "Должно быть переопределено в наследнике"
  end

  def write_to_file
    raise NotImplementedError, "Должно быть переопределено в наследнике"
  end
end
