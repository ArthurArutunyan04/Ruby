class Student
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

  
  def id
    @id
  end

  def surname
    @surname
  end

  def name
    @name
  end

  def patronymic
    @patronymic
  end

  def phone
    @phone
  end

  def telegram
    @telegram
  end

  def email
    @email
  end

  def git
    @git
  end

  def id=(value)
    @id = value
  end

  def surname=(value)
    @last_name = value
  end

  def name= (value)
    @name = value
  end

  def patronymic=(value)
    @patronymic = value
  end

  def phone=(value)
    @phone = value
  end

  def telegram=(value)
    @telegram = value
  end

  def email=(value)
    @email = value
  end

  def git=(value)
    @git = value
  end
end

