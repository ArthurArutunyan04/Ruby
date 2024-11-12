require_relative 'human'

class Student_short < Human
  attr_accessor :id
  def self.from_student(student)
    student_short = new(
      surname: student.surname_with_initials.split[0],
      name: student.surname_with_initials.split[1][0],
      patronymic: student.surname_with_initials.split[1][2],
      git: student.git,
      phone: student.phone,
      telegram: student.telegram,
      email: student.email,
      id: student.id
    )
    student_short
  end
  
  def self.from_info_string(id, info_string)
    surname, name, patronymic, phone, telegram, email, git = parse_info_string(info_string)
    
    student_short = new(
      surname: surname,
      name: name,
      patronymic: patronymic,
      git: git,
      phone: phone,
      telegram: telegram,
      email: email,
      id: id
    )
    student_short
  end

  def self.parse_info_string(info_string)
    details = info_string.split(';')
    details.map(&:strip)
  end


  def to_s
    output = []
    output << "ID: #{@id}" if @id
    output << super
    output.join("; ")
  end


  private_class_method :new

  def initialize(id: nil, surname:, name:, patronymic:, git: nil, phone: nil, telegram: nil, email: nil)
    super(id: id, surname: surname, name: name, patronymic: patronymic, git: git, phone: phone, telegram: telegram, email: email)
  end
end
