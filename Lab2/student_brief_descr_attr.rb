class Student

  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(surname, name, patronymic,id = nil,phone = nil, telegram = nil, email = nil, git = nil)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end
end
