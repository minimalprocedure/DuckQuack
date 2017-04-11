
num1 = 210
num2 = 45

def mcd(number1, number2)
  rest = number1 % number2
  if rest == 0
    number2
  else
    mcd(number2, rest)
  end
end

def mcm(number1, number2)
  (number1 * number2) / mcd(number1, number2)
end

puts mcd(num1, num2)
puts mcm(num1, num2)
