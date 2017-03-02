
#Fizz Buzz

lista = (1..100).reduce([]) {|memo, numero|
         div3, div5, = numero % 3 == 0, numero % 5 == 0
         memo << (div3 && div5 ? "FizzBuzz" : (div3 ? "Fizz" :  (div5 ? "Buzz" : numero)))
}
puts lista