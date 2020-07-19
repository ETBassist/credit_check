require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require './lib/credit_card'

class CreditCheckTest < Minitest::Test

  def test_number_exists
    card = Card.new("5541808923795240")

    assert_equal "5541808923795240", card.number
  end

  def test_multiply_every_other
    card = Card.new("5541808923795240")

    card.every_other_number
    assert_equal [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0], card.temp_array
  end

  def test_sum_of_double_digits
    card = Card.new("5541808923795240")

    card.every_other_number
    card.sum_double_digits
    assert_equal [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0], card.temp_array
  end

  def test_valid
    card = Card.new("5541808923795240")
    card.every_other_number
    card.sum_double_digits
    card.sum_all

    assert card.valid
  end

  def test_full_run
    card = Card.new("5541808923795240")
    card.every_other_number
    card.sum_double_digits
    card.sum_all

    assert_equal "The number 5541808923795240 is valid!", card.valid?
  end

  def test_invalid_number
    card = Card.new("5541801923795240")
    card.every_other_number
    card.sum_double_digits
    card.sum_all

    assert_equal "The number 5541801923795240 is invalid!", card.valid?
  end

  def test_other_valid_number
    card = Card.new("6011797668867828")
    card.every_other_number
    card.sum_double_digits
    card.sum_all

    assert_equal "The number 6011797668867828 is valid!", card.valid?

  end


  def test_credit_card_exists
    card = CreditCard.new("6011797668867828", 1000)

    assert_equal "6011797668867828", card.number
    assert_equal 1000, card.limit
  end

  def test_last_four_digits
    card = CreditCard.new("6011797668867828", 1000)

    assert_equal "7828", card.last_four
  end

  def test_invalid_by_default
    card = CreditCard.new("6011797668867828", 1000)

    refute card.valid
  end

  def test_temp_array_is_array
    card = CreditCard.new("6011797668867828", 1000)

    assert card.temp_array.kind_of?(Array)
  end

  def test_full_function
    card = CreditCard.new("6011797668867828", 1000)

    assert card.is_valid?
  end

  def test_valid_american_express
    card = CreditCard.new("342804633855673", 10000)
    require "pry"; binding.pry
    assert card.is_valid?
  end

  def test_checksum_works
    card = CreditCard.new("342804633855673", 1000)
    assert_equal 3, card.calculate_checksum
  end

  def test_invalid_number
    card = CreditCard.new("4024007106512380", 0)

    refute card.is_valid?
  end

  def test_invalid_amex
    card = CreditCard.new("342801633855673", 0)

    refute card.is_valid?
  end

end
