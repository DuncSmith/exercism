class Palindromes
  def initialize(options)
    @min_factor = options[:min_factor] || 1
    @max_factor = options[:max_factor] || 1
  end

  def generate
    @palindromes ||=
      (min_factor..max_factor).to_a.repeated_combination(2)
      .map { |a, b| [a * b, [a, b]] }
      .sort { |a, b| a[0] <=> b[0] }
      .select { |p, _| palindrome?(p) }
      .group_by { |product, _| product }
      .map { |v, e| Palindrome.new(v, e.map { |_, f| f }) }
  end

  def largest
    palindromes.last
  end

  def smallest
    palindromes.first
  end

  private

  attr_reader :min_factor, :max_factor, :palindromes

  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end

  class Palindrome
    attr_reader :value, :factors

    def initialize(value, factors)
      @value = value
      @factors = factors
    end
  end
end
