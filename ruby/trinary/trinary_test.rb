#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'trinary'

class TrinaryTest < Minitest::Test
  def test_trinary_1_is_decimal_1
    assert_equal 1, Trinary.new('1').to_decimal
  end

  def test_trinary_2_is_decimal_2
    assert_equal 2, Trinary.new('2').to_decimal
  end

  def test_trinary_10_is_decimal_3
    assert_equal 3, Trinary.new('10').to_decimal
  end

  def test_trinary_11_is_decimal_4
    assert_equal 4, Trinary.new('11').to_decimal
  end

  def test_trinary_100_is_decimal_9
    assert_equal 9, Trinary.new('100').to_decimal
  end

  def test_trinary_112_is_decimal_14
    assert_equal 14, Trinary.new('112').to_decimal
  end

  def test_trinary_222_is_26
    assert_equal 26, Trinary.new('222').to_decimal
  end

  def test_trinary_1122000120_is_32091
    assert_equal 32_091, Trinary.new('1122000120').to_decimal
  end

  def test_invalid_trinary_is_decimal_0
    assert_equal 0, Trinary.new('carrot').to_decimal
  end

  def test_base_4_1_is_decimal_1
    assert_equal 1, BaseN.new('1', 4).to_decimal
  end

  def test_base_6_135_is_decimal_59
    assert_equal 59, BaseN.new('135', 6).to_decimal
  end

  def test_base_2_1110000110_is_decimal_902
    assert_equal 902, BaseN.new('1110000110', 2).to_decimal
  end

  def test_invalid_base_3_is_decimal_0
    assert_equal 0, BaseN.new('444', 3).to_decimal
  end

  def test_error_if_base_less_than_1
    assert_raises ArgumentError do
      BaseN.new('?', 0)
    end
  end

  def test_base_1_all_values_are_decimal_0
    assert_equal 0, BaseN.new('000000', 1).to_decimal
  end

  def test_error_if_base_greater_than_36
    assert_raises ArgumentError do
      BaseN.new('?', 37)
    end
  end

  def test_invalid_empty_base_value_is_decimal_0
    assert_equal 0, BaseN.new('', 2).to_decimal
  end

  def test_base_16_f3_is_decimal_243
    assert_equal 243, BaseN.new('F3', 16).to_decimal
  end

  def test_base_20_1000_is_decimal_8000
    assert_equal 8000, BaseN.new('1000', 20).to_decimal
  end

  def test_base_4_custom_map_cats_is_decimal_210
    assert_equal(
      210,
      BaseN.new(
        'CATS',
        4,
        'C' => 3, 'A' => 1, 'T' => 0, 'S' => 2).to_decimal)
  end

  def test_error_if_custom_map_missing_value
    assert_raises ArgumentError do
      BaseN.new('A', 2, 'A' => 0, 'B' => 2)
    end
  end

  def test_error_if_custom_map_duplicate_value
    assert_raises ArgumentError do
      BaseN.new('A', 2, 'A' => 0, 'B' => 1, 'C' => 1)
    end
  end
end
