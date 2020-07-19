class CreditCard
  attr_accessor :number, :card_limit, :valid, :temp_array, :checksum, :sum_of_digits
# Need to create some intermediary arrays/attributes to hold things so that
# current attributes aren't permanently altered when calculating validity
  def initialize(number, card_limit)
    @number = number
    @card_limit = card_limit
    @valid = false
    @temp_array = []
    @checksum = 0
    @sum_of_digits = 0
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
      if @number.length.even?
        if counter.even?
          @temp_array << num.to_i * 2
        else
          @temp_array << num.to_i
        end
      else
        if counter.odd?
          @temp_array << num.to_i * 2
        else
          @temp_array << num.to_i
        end
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
    @sum_of_digits = @temp_array.sum
    @valid = true if @sum_of_digits % 10 == 0
    return @valid
  end

  def calculate_checksum
    @checksum = @number.split('').last.to_i
  end
end
