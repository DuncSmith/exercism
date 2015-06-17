require 'ostruct'

class Palindromes
  def initialize(options)
    @min_factor = options[:min_factor] || 1
    @max_factor = options[:max_factor] || 1
  end

  def generate
    @palindromes ||=
      products.select { |p, _| palindrome?(p) }
      .sort { |a, b| a[0] <=> b[0] }
      .map { |v, f| OpenStruct.new(value: v, factors: f) }
  end

  def largest
    palindromes.last
  end

  def smallest
    palindromes.first
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
