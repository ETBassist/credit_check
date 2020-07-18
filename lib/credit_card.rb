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
