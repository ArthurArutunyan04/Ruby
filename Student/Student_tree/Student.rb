require_relative 'human'
require 'date'

class Student < Human

  include Comparable

  attr_reader :surname, :name, :patronymic, :date_birth

  def initialize(date_birth:, surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    super(id: id, surname: surname, name: name, patronymic: patronymic, phone: phone, telegram: telegram, email: email, git: git)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.date_birth = date_birth
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

  def date_birth=(date_birth)
    @date_birth = Date.parse(date_birth)
  end

  def patronymic=(patronymic)
    if Student.valid_patronymic?(patronymic)
      @patronymic = patronymic
    else
      raise ArgumentError.new("Некорректное отчество")
    end
  end


  def to_s
    "
      ID = #{@id || 'Пусто'}
      SWI = #{generate_surname_with_initials(@surname, @name, @patronymic)}
      Phone = #{@phone || 'Пусто'}
      Telegram = #{@telegram || 'Пусто'}
      Email = #{@email || 'Пусто'}
      Git = #{@git || 'Пусто'}
      Date_birth = #{@date_birth}
    "
  end

  def get_info_for_tree
    "ФИО: #{generate_surname_with_initials(@surname, @name, @patronymic)}; Дата рождения: #{date_birth}"
  end

end
