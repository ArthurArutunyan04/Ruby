def div_with_sum_digit_less_number(number)
  result = 1
  orig_digit_sum = sum_digits(number)

  for i in 1..number
    if number % i == 0 && sum_digits(i) < orig_digit_sum
        result *= i
      end
  end  
  result
end

def sum_digits(number)
  sum = 0
  while number > 0
    sum += number % 10
    number /= 10
  end
  sum
end

print "Введите число: "
number = gets.chomp.to_i
function_3 = div_with_sum_digit_less_number(number)
if function_3 == 1
  print "Таких делителей нет\n"
else
  print "Произведение делителей, сумма цифр которых меньше суммы цифр числа: #{function_3}\n"
end