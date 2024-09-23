class Student
  attr_accessor :id, :surname, :name, :patronymic, :telegram, :email, :git
  attr_reader :phone

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    self.id = id
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end

  def to_s
    "
    ID = #{@id || "Пусто"}
    Surname = #{@surname}
    Name = #{@name}
    Patronymic = #{@patronymic}
    Phone = #{@phone || "Пусто"}
    Telegram = #{@telegram || "Пусто"}
    Email = #{@email || "Пусто"}
    Git = #{@git || "Пусто"}
    "
  end

  def self.valid_phone?(phone)
    phone =~ /^\+\d{11}$/  
  end

  def phone=(phone)
    if Student.valid_phone?(phone)
      @phone = phone
    else
      @phone = nil  
    end
  end
end
  
student1 = Student.new(name: "Pudge", surname: "MoM", patronymic: "Midas", phone: "+77777777777")
student2 = Student.new(name: "Петр", surname: "Петров", patronymic: "Петрович", phone: "123zxcgg")

puts student1.to_s
puts student2.to_s
