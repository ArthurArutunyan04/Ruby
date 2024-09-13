def count_odd_digits_greater_than_3(number)
  count = 0
  while number > 0
    digit = number % 10
    if digit % 2 !=0 && digit > 3
      count += 1
    end
    number /= 10
  end
  count
end

print "Введите число: "
number = gets.chomp.to_i
function_2 = count_odd_digits_greater_than_3(number)
print("Количество нечетных цифр, больших 3: #{function_2}")