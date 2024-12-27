class Student_list_interface
  def find_by_id(id)
    raise NotImplementedError, "Должно быть переопределено"
  end

  def get_k_n_student_short_list(k:, n:)
    raise NotImplementedError, "Должно быть переопределено"
  end

  def new_id
    raise NotImplementedError, "Должно быть переопределено"
  end

  def add_student(student)
    raise NotImplementedError, "Должно быть переопределено"
  end

  def replace_student_by_id(id, new_student)
    raise NotImplementedError, "Должно быть переопределено"
  end
  def delete_student_by_id(id)
    raise NotImplementedError, "Должно быть переопределено"
  end

  def get_student_short_count
    raise NotImplementedError, "Должно быть переопределено"

  end

  def close
    raise NotImplementedError, "Должно быть переопределено"
  end
end
