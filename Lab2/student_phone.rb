class Student
  attr_accessor :id, :surname, :name, :patronymic, :telegram, :email, :git
  attr_reader :phone

  def initialize(parametr = {})
    @id = parametr[:id]
    @surname = parametr[:surname]
    @name = parametr[:name]
    @patronymic = parametr[:patronymic]
    self.phone = parametr[:phone]  
    @telegram = parametr[:telegram]
    @email = parametr[:email]
    @git = parametr[:git]
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
puts "Student1:#{student1.surname}, #{student1.name}, #{student1.patronymic}, #{student1.phone}"  

student2 = Student.new(name: "Петр", surname: "Петров", patronymic: "Петрович", phone: "123zxcgg")
puts "Student2:#{student2.surname}, #{student2.name}, #{student2.patronymic}, #{student2.phone}"  