require './lib/credit_card'

print "Input card number you'd like to validate: "
a = gets.chomp

card = CreditCard.new(a, 1000)
card.is_valid?
if card.valid == true
  puts "The number #{card.number} is valid!"
else
  puts "The number #{card.number} is not valid!"
end
