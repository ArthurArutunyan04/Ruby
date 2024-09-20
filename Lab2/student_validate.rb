class Student
  attr_reader :id, :surname, :name, :patronymic, :telegram, :email, :git, :phone

  def initialize(parametr = {})
    self.id = parametr[:id]
    self.surname = parametr[:surname]
    self.name = parametr[:name]
    self.patronymic = parametr[:patronymic]
    self.phone = parametr[:phone]
    self.telegram = parametr[:telegram]
    self.email = parametr[:email]
    self.git = parametr[:git]
  end

  def phone=(phone)
    @phone = phone =~ /^\+\d{11}$/ ? phone : nil
  end

  def id=(id)
    @id = id.to_s =~ /^\d+$/ ? id : nil
  end

  def surname=(surname)
    @surname = surname =~ /^[A-ZА-Я][a-zа-я]*$/ ? surname : nil
  end

  def name=(name)
    @name = name =~ /^[A-ZА-Я][a-zа-я]*$/ ? name : nil
  end

  def patronymic=(patronymic)
    @patronymic = patronymic =~ /^[A-ZА-Я][a-zа-я]*$/ ? patronymic : nil
  end

  def email=(email)
    @email = email =~ /^[a-zA-Z0-9._%+-]{3,10}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/ ? email : nil
  end

  def telegram=(telegram)
    @telegram = telegram =~ /^@[a-zA-Z0-9_]{1,}$/ ? telegram : nil
  end

  def git=(git)
    @git = git =~ /^https:\/\/github\.com\/[a-zA-Z0-9_-]+\/?$/ ? git : nil
  end
end