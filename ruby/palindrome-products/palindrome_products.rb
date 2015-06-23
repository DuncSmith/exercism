require 'ostruct'

class Palindromes
  attr_reader :largest, :smallest

  def initialize(options)
    @min_factor = options[:min_factor] || 1
    @max_factor = options[:max_factor] || 1
  end

  def generate
    @smallest = smallest_palindrome
    @largest = largest_palindrome
  end

  private

  attr_reader :min_factor, :max_factor

  def pairs
    (min_factor..max_factor).to_a.repeated_combination(2)
  end

  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end

  def smallest_palindrome
    find_palindrome(
      max_factor**2,
      min_factor.upto(max_factor).to_a.repeated_combination(2),
      ->(x, v) { x**2 > v },
      ->(p, v) { v > p })
  end

  def largest_palindrome
    find_palindrome(
      min_factor**2,
      max_factor.downto(min_factor).to_a.repeated_combination(2),
      ->(x, v) { x**2 < v },
      ->(p, v) { v < p })
  end

  def find_palindrome(value, pairs, found, better)
    factors = []
    pairs.each do |m, n|
      break if found[m, value]
      product = m * n
      next unless palindrome?(product)
      if better[product, value]
        value = product
        factors = []
      end
      factors << [n, m] if product == value
    end
    OpenStruct.new(value: value, factors: factors)
  end
end
