require 'set'

class SumOfMultiples
  def self.to(limit)
    SumOfMultiples.new(3, 5).to(limit)
  end

  def initialize(*numbers)
    @numbers = numbers.flatten
  end

  def to(limit)
    numbers.reduce(Set.new) do |m, n|
      m.union(multiples(n, limit))
    end.reduce(:+) || 0
  end

  private

  attr_reader :numbers

  def multiples(number, limit)
    Set.new(number.multiples.take_while { |x| x < limit })
  end
end

module FixnumExtension
  def multiples
    return enum_for(:multiples) unless block_given?
    multiple = 0
    loop { yield multiple += self }
  end
end

Fixnum.send :include, FixnumExtension
