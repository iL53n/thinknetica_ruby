=begin
6. Сумма покупок. 
Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). 
Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. 
На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, 
а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. 
Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end


total = 0
cart = {}

loop do
  print "Введите название товара(или stop для завершения покупок): "
  title = gets.chomp.upcase
  break if title == 'STOP'
  print "Цена: "
  price = gets.to_f
  print "Количество: "
  quantity = gets.to_f
  cart[title] = { price: price, quantity: quantity }
end

cart.each do |title, value|
  summ_product = value[:price] * value[:quantity] 
  #KeyError value.fetch(:price) - fetch обычно используют, когда нужно задать какое-то значение/поведение в случае отсутствия ключа.
  #Если значение по умолчанию не требуется, оптимальнее использовать оператор []
  puts "Наименование: #{title} ... Количество: #{value[:quantity]} ... Сумма: #{summ_product}"
  total += summ_product
end

puts "Итого в корзине на сумму: #{total} (наименований: #{cart.size})"

