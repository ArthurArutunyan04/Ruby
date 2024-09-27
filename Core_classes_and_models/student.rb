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

