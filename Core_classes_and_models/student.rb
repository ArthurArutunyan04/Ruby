require_relative 'human'

class Student < Human
  attr_reader :id, :patronymic

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    super(surname: surname, name: name, patronymic: patronymic, git: git, phone: phone, telegram: telegram, email: email)
    self.id = id
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
  end

  def to_s
    "
    ID = #{@id || 'Пусто'}
    SWI = #{@surname_with_initials || 'Пусто'}
    Phone = #{@phone || 'Пусто'}
    Telegram = #{@telegram || 'Пусто'}
    Email = #{@email || 'Пусто'}
    Git = #{@git || 'Пусто'}
    "
  end

  def getInfo
    "#{surname_with_initials}; Git: #{@git}; Контакт: #{contact}"
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
end

