class Human
  attr_reader :surname_with_initials, :git, :contact, :phone, :telegram, :email
  
  def initialize(surname:, name:, patronymic:, git:, phone: nil, telegram: nil, email: nil)
    @surname_with_initials = "#{surname} #{name[0]}.#{patronymic[0]}."
    self.git = git
    set_contacts(phone: phone, telegram: telegram, email: email)
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
  
  def to_s
    output = []
    output << "#{@surname_with_initials}"
    output << "Git: #{@git}" 
    output << "Контакт: #{@contact}"
    output.join("; ")
  end
  
  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
    @contact = determine_contact(phone, telegram, email)
  end
  
  private
  
  def phone=(phone)
    if phone =~ /^\+\d{11}$/
      @phone = phone
    else
      raise ArgumentError.new("Некорректный номер телефона")
    end
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
end
