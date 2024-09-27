class Student
  attr_reader :id, :surname, :name, :patronymic, :telegram, :email, :git, :phone

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    self.id = id
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    set_contacts(phone: phone, telegram: telegram, email: email, git: git)
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

  def getInfo
    "#{surname_with_initials}; Git: #{@git}; Contact: #{contact_method}"
  end

  def surname_with_initials
    "#{@surname} #{@name[0]}.#{@patronymic[0]}."
  end

  def contact_method
    if @phone
      "Phone: #{@phone}"
    elsif @telegram
      "Telegram: #{@telegram}"
    elsif @email
      "Email: #{@email}"
    else
      "Не указано"
    end
  end
  
  def set_contacts(phone: nil, telegram: nil, email: nil, git: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end
  
  def id=(id)
    @id = id.to_s =~ /^\d+$/ ? id : nil
  end

  def surname=(surname)
    @surname = surname =~ /^[A-ZА-Я][a-zа-я]+$/ ? surname : nil
  end

  def name=(name)
    @name = name =~ /^[A-ZА-Я][a-zа-я]+$/ ? name : nil
  end

  def patronymic=(patronymic)
    @patronymic = patronymic =~ /^[A-ZА-Я][a-zа-я]*$/ ? patronymic : nil
  end

  private

  def phone=(phone)
    @phone = phone =~ /^\+\d{11}$/ ? phone : nil
  end

  def telegram=(telegram)
    @telegram = telegram =~ /^@[a-zA-Z0-9_]{1,}$/ ? telegram : nil
  end

  def email=(email)
    @email = email =~ /^[a-zA-Z0-9.%+-]{3,10}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/ ? email : nil
  end

  def git=(git)
    @git = git =~ /^https:\/\/github.com\/[a-zA-Z0-9-]+\/?$/ ? git : nil
  end

  def validate
    validate_git && validate_contact
  end

  def validate_git
    !@git.nil?
  end

  def validate_contact
    !@phone.nil? && !@telegram.nil? && !@email.nil?
  end
end


class Student_short
  attr_reader :surname_with_initials, :git, :contact

  def initialize(student: nil, id: nil, info_string: nil)
    if student
      @surname_with_initials = student.surname_with_initials
      @git = student.git
      @contact = student.contact_method
    else id && info_string
      @id = id
      parse_info_string(info_string)
    end
  end

  def to_s
    output = []
    output << "ID: #{@id}" if @id 
    output << "Фамилия и инициалы: #{@surname_with_initials}"
    output << "Git: #{@git}" 
    output << "Контакт: #{@contact}"
    output.join("; ")
  end

  private

  def parse_info_string(info_string)
    details = info_string.split(';')
    surname, name, patronymic, phone, telegram, email, git = details.map(&:strip)
    @surname_with_initials = "#{surname} #{name[0]}.#{patronymic[0]}."
    @git = git
    @contact = determine_contact(phone, telegram, email)
  end

  def determine_contact(phone, telegram, email)
    contact_info = phone || telegram || email || "Не указано"
    case contact_info
    when phone
      "Phone: #{phone}"
    when telegram
      "Telegram: #{telegram}"
    when email
      "Email: #{email}"
    else
      "Не указано"
    end
  end
end
