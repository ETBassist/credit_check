card_number = "5541808923795240"

# Your Luhn Algorithm Here
class Card
  attr_accessor :number, :temp_array,  :valid

  def initialize(number)
    @number = number
    @temp_array = []
    @valid = false
  end

  def every_other_number
    counter = 0
    @number.split('').each do |digit|
      if counter.even?
       @temp_array << digit.to_i * 2
      else
       @temp_array << digit.to_i
      end
      counter += 1
    end
  end

  def sum_double_digits
    @temp_array = @temp_array.map do |number|
      if number.digits.count > 1
        number.digits[0] + number.digits[1]
      else
        number
      end
    end
  end

  def sum_all
    @temp_array = @temp_array.sum
    @valid = true if @temp_array % 10 == 0
  end

  def valid?
    if @valid == true
      "The number #{@number} is valid!"
    else
      "The number #{@number} is invalid!"
    end
  end

end
# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
# card.valid?
# ===============================================================

class CreditCard
  attr_accessor :number, :card_limit, :valid, :temp_array

  def initialize(number, card_limit)
    @number = number
    @card_limit = card_limit
    @valid = false
    @temp_array = []
  end

  def card_number
    @number
  end

  def limit
    @card_limit
  end

  def last_four
    @number[-4..-1]
  end

  def is_valid?
    counter = 0
    @number.split('').each do |num|
      if counter.even?
        @temp_array << num.to_i * 2
      else
        @temp_array << num.to_i
      end
      counter += 1
    end
    @temp_array = @temp_array.map do |num|
      if num.digits.count > 1
        num.digits[0] + num.digits[1]
      else
        num
      end
    end
    @temp_array = @temp_array.sum
    @valid = true if @temp_array % 10 == 0
    return @valid
  end

end
