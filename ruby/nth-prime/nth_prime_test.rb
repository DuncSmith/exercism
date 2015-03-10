require 'minitest/autorun'
require_relative 'prime'

class TestPrimes < MiniTest::Unit::TestCase
  def test_first
    assert_equal 2, Prime.nth(1)
  end

  def test_second
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    assert_equal 13, Prime.nth(6)
  end

  def test_eleventh_prime
    assert_equal 31, Prime.nth(11)
  end

  def test_500th_prime
    assert_equal 3571, Prime.nth(500)
  end

  def test_999th_prime
    assert_equal 7907, Prime.nth(999)
  end

  def test_1000th_prime
    assert_equal 7919, Prime.nth(1000)
  end

  def test_big_prime
    Prime.instance_eval('@primes = nil')
    Prime.instance_eval('@next_candidate = nil')
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
    assert_equal 104_743, Prime.nth(10_001)
  end

  def test_weird_case
    assert_raises ArgumentError do
      Prime.nth(0)
    end
  end
  
  # def test_time
    # iterations = 100
    # start_time = Time.now
    # (1..iterations).each do |_|
      # Prime.instance_eval('@primes = nil')
      # Prime.instance_eval('@next_candidate = nil')
      # Prime.nth(10_001)
    # end
    # end_time = Time.now
    # duration = end_time - start_time
    # puts duration / iterations
  # end
end
