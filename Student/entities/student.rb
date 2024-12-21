require_relative 'human'
require 'date'

class Student < Human

  include Comparable

  attr_reader :surname, :name, :patronymic, :date_birth

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil, date_birth: nil)
    super(id: id, surname: surname, name: name, patronymic: patronymic, phone: phone, telegram: telegram, email: email, git: git)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.date_birth = date_birth
  end

  def self.create_from_hash(student_hash)
    self.new(
      surname: student_hash[:surname],
      name: student_hash[:name],
      patronymic: student_hash[:patronymic],
      date_birth: student_hash[:date_birth],
      id: student_hash[:id],
      phone: student_hash[:phone],
      telegram: student_hash[:telegram],
      email: student_hash[:email],
      git: student_hash[:git]
    )
  end

  def <=>(other)
    return nil unless other.is_a?(Student)

    if self.date_birth > other.date_birth
      return -1
    elsif self.date_birth < other.date_birth
      return 1
    else
      return 0
    end
  end

  def self.valid_surname?(surname)
    surname.match?(/^[A-ZА-Я][a-zа-я]+$/)
  end

  def self.valid_name?(name)
    name.match?(/^[A-ZА-Я][a-zа-я]+$/)
  end

  def self.valid_patronymic?(patronymic)
    patronymic.match?(/^[A-ZА-Я][a-zа-я]+$/)
  end

  def surname=(surname)
    if Student.valid_surname?(surname)
      @surname = surname
    else
      raise ArgumentError.new("Некорректная фамилия")
    end
  end

  def name=(name)
    if Student.valid_name?(name)
      @name = name
    else
      raise ArgumentError.new("Некорректное имя")
    end
  end

  def patronymic=(patronymic)
    if Student.valid_patronymic?(patronymic)
      @patronymic = patronymic
    else
      raise ArgumentError.new("Некорректное отчество")
    end
  end

  def date_birth=(date_birth)
    @date_birth = Date.parse(date_birth)
  end

  def initials
    generate_surname_with_initials(@surname, @name, @patronymic)
  end

  def to_s
    "
    ID = #{@id || 'Пусто'}
    SWI = #{generate_surname_with_initials(@surname, @name, @patronymic)}
    Phone = #{@phone || 'Пусто'}
    Telegram = #{@telegram || 'Пусто'}
    Email = #{@email || 'Пусто'}
    Git = #{@git || 'Пусто'}
    Data_birth = #{@date_birth || 'Пусто'}
    "
  end

  def to_h
    {
      surname: @surname,
      name: @name,
      patronymic: @patronymic,
      id: @id,
      phone: @phone,
      telegram: @telegram,
      email: @email,
      git: @git
    }
  end
end



