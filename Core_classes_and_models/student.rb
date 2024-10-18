require_relative 'human'

class Student < Human
  attr_reader :id, :surname, :name, :patronymic, :git

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    super(surname: surname, name: name, patronymic: patronymic, phone: phone, telegram: telegram, email: email)
    self.id = id
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.git = git
  end

  def to_s
    "
    ID = #{@id || 'Пусто'}
    SWI = #{@surname_with_initials || 'Пусто'}
    Phone = #{@phone}
    Telegram = #{@telegram || 'Пусто'}
    Email = #{@email || 'Пусто'}
    Git = #{@git || 'Пусто'}
    "
  end

  def getInfo
    "#{surname_with_initials}; Git: #{@git}; Контакт: #{contact}"
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

  def git=(git)
    @git = git =~ /^https:\/\/github.com\/[a-zA-Z0-9-]+\/?$/ ? git : nil
  end

  private
  
  def id=(id)
    @id = id.to_s =~ /^\d+$/ ? id : nil
  end
end

