class Student
  
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

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


  def to_s()
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
end
