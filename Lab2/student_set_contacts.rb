class Student
  attr_reader :id, :surname, :name, :patronymic, :telegram, :email, :git, :phone

  def initialize(parametr = {})
    self.id = parametr[:id]
    self.surname = parametr[:surname]
    self.name = parametr[:name]
    self.patronymic = parametr[:patronymic]
    self.git = parametr[:git]
    set_contacts(parametr[:phone], parametr[:email], parametr[:telegram])
  end

  def git=(git)
    @git = git =~ /^https:\/\/github\.com\/[a-zA-Z0-9_-]+\/?$/ ? git : nil
  end

  def validate
    validate_git && validate_contact
  end

  def validate_git
    !@git.nil?
  end

  def validate_contact
    !@phone.nil? || !@telegram.nil? || !@email.nil?
  end

  # Метод для установки контактов
  def set_contacts(phone = nil, email = nil, telegram = nil)
    self.phone = phone
    self.email = email
    self.telegram = telegram
  end

  private

  def phone=(phone)
    @phone = phone =~ /^\+\d{11}$/ ? phone : nil
  end

  def email=(email)
    @email = email =~ /^[a-zA-Z0-9._%+-]{3,10}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/ ? email : nil
  end

  def telegram=(telegram)
    @telegram = telegram =~ /^@[a-zA-Z0-9_]{1,}$/ ? telegram : nil
  end
end
