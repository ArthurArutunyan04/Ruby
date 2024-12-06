class Human
  attr_accessor :id, :contact, :phone, :telegram, :email, :git
  attr_reader :surname_with_initials
  def initialize(id: nil, surname:, name:, patronymic:,  git: nil, phone: nil, telegram: nil, email: nil)
    @surname_with_initials = "#{surname} #{name[0]}.#{patronymic[0]}."
    self.git = git
    self.id = id
    set_contacts(phone: phone, telegram: telegram, email: email)
  end

  def self.valid_id?(id)
    id.match?(/^[1-9]\d*$/)
  end

  def self.valid_phone?(phone)
    phone.match?(/^\+\d{11}$/)
  end

  def self.valid_telegram?(telegram)
    telegram.match?(/^@[a-zA-Z0-9_]{1,}$/)
  end

  def self.valid_email?(email)
    email.match?(/^[a-zA-Z0-9.%+-]{3,10}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/)
  end

  def self.valid_git?(git)
    git.match?(/^https:\/\/github.com\/[a-zA-Z0-9-]+\/?$/)
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
    @contact = determine_contact(phone, telegram, email)
  end

  def id=(id)
    if id.nil? || Human.valid_id?(id)
      @id = id
    else
      raise ArgumentError.new("Некорректный id")
    end
  end

  def git=(git)
    if git.nil? || Human.valid_git?(git)
      @git = git
    else
      raise ArgumentError.new("Некорректный git")
    end
  end

  def to_s
    output = []
    output << "ФИО: #{surname_with_initials}"
    output << "Контакт: #{@contact}" unless @contact.nil? || @contact.empty?
    output << "Git: #{@git}" if git
    output.join("; ")
  end

  def getInfo
    "#{generate_surname_with_initials(@surname, @name, @patronymic)}; Git: #{@git || 'Пусто'}; Контакт: #{@contact || 'Пусто'}"
  end


  protected

  def generate_surname_with_initials(surname, name, patronymic)
    "#{surname} #{name[0]}.#{patronymic[0]}."
  end

  private

  def determine_contact(phone, telegram, email)
    contact_info = phone || telegram || email
    case contact_info
    when phone
      "Phone: #{phone}"
    when telegram
      "Telegram: #{telegram}"
    when email
      "Email: #{email}"
    end
  end

  def phone=(phone)
    if phone.nil? || Human.valid_phone?(phone)
      @phone = phone
    else
      raise ArgumentError.new("Некорректный номер телефона")
    end
  end

  def telegram=(telegram)
    if telegram.nil? || Human.valid_telegram?(telegram)
      @telegram = telegram
    else
      raise ArgumentError.new("Некорректный telegram")
    end
  end

  def email=(email)
    if email.nil? || Human.valid_email?(email)
      @email = email
    else
      raise ArgumentError.new("Некорректный email")
    end
  end
end
