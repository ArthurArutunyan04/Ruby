class Student

  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(parametr = {})
    @id = parametr[:id]
    @surname = parametr[:surname]
    @name = parametr[:name]
    @patronymic = parametr[:patronymic]
    @phone = parametr[:phone]
    @telegram = parametr[:telegram]
    @email = parametr[:email]
    @git = parametr[:git]
  end
end