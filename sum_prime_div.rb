def sum_prime_divs(number)  #функция для нахождения суммы простых делителей
  sum = 0
  for i in 2..number
    if number % i == 0 && prime?(i)
      sum += i
    end
  end
  sum
end

def prime?(div)  #функция для проверки на простоту 
  if div < 2
    return false
  end
  
  for i in 2..(div - 1)
    if div % i == 0
      return false
    end
  end
  true
end
 
print "Введите число: "
number = gets.chomp.to_i #Считывает введенное число, удаляет символ новой строки и преобразовывает число в целое 
function_1 = sum_prime_divs(number)
print("Сумма простых делителей: #{function_1}\n")
 
