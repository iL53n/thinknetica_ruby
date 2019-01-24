
=begin
Квадратное уравнение. 
Пользователь вводит 3 коэффициента a, b и с. 
Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. 
При этом возможны следующие варианты:
  Если D > 0, то выводим дискриминант и 2 корня
  Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
  Если D < 0, то выводим дискриминант и сообщение "Корней нет"
Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru). Для вычисления квадратного корня, нужно использовать  
 
Math.sqrt
 
 Например,  
 
Math.sqrt(16)
 
  вернет 4, т.е. квадратный корень из 16.
=end

puts "Введите 3 коэффициента: "
print "A: "
a = gets.to_f 
print "B: "
b = gets.to_f
print "C: "
c = gets.to_f

d = b**2 - 4 * a * c
sqrt = Math.sqrt(d)

if d > 0 
  x1 = (-b + sqrt) / (2.0 * a)
  x2 = (-b - sqrt) / (2.0 * a)
  puts "Дискриминат: #{d}"
  puts "Корень 1: #{x1}"
  puts "Корень 2: #{x2}"
elsif d == 0
  x1 = -b / (2.0 * a)
  puts "Дискриминат: #{d}"
  puts "Т.к. дискриминант равен нулю, оба корня равны: #{x1}"
else d < 0
  puts "Корней нет"
end
