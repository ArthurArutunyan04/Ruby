require 'pg'

connection = PG.connect(
  dbname: 'students',
  user: 'postgres',
  password: '1337',
  host: 'localhost',
  port: 5432
)


query = "SELECT * FROM student WHERE date_birth > '1997-01-01';"
result = connection.exec(query)

result.each do |row|
  puts "ID: #{row['id']}, Фамилия: #{row['surname']}, Имя: #{row['name']}, Отчество: #{row['patronymic']}, Телефон: #{row['phone_number']}, Email: #{row['email']}, Telegram: #{row['telegram']}, Git: #{row['git']}, Дата рождения: #{row['date_birth']}"
end

connection.close if connection
