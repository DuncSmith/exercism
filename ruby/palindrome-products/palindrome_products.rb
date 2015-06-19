require 'ostruct'

class Palindromes
  attr_reader :largest, :smallest

  def initialize(options)
    @min_factor = options[:min_factor] || 1
    @max_factor = options[:max_factor] || 1
  end

  def generate
    smallest_value = max_factor**2
    smallest_factors = []
    min_factor.upto(max_factor).each do |m|
      break if m**2 > smallest_value
      m.upto(max_factor).each do |n|
        product = m * n
        break if product > smallest_value
        next unless palindrome?(product)
        if smallest_value > product
          smallest_value = product
          smallest_factors = []
        end
        smallest_factors << [m, n]
      end
    end
    @smallest =
      OpenStruct.new(value: smallest_value, factors: smallest_factors)

    largest_value = min_factor**2
    largest_factors = []
    max_factor.downto(min_factor).each do |m|
      break if m**2 < largest_value
      m.downto(min_factor).each do |n|
        product = m * n
        break if product < largest_value
        next unless palindrome?(product)
        if largest_value < product
          largest_value = product
          largest_factors = []
        end
        largest_factors << [n, m]
      end
    end
    @largest =
      OpenStruct.new(value: largest_value, factors: largest_factors)
  end

  private

  attr_reader :min_factor, :max_factor, :palindromes

  def products
    pairs.reduce({}) { |a, (m, n)| (a[m * n] ||= []) << [m, n] && a }
  end

  def pairs
    (min_factor..max_factor).to_a.repeated_combination(2)
  end

  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end
end
