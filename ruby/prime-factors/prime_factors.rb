require 'benchmark'
require 'prime'

module EnumerableExtensions; end

module PrimeFactors
  E = EnumerableExtensions

  def self.for(number)
    found_all_factors = ->(_, prime) { number < prime }
    primes = Prime.each(number).extend(E)
    primes.reduce_until(found_all_factors, []) do |a, prime|
      divisible = -> { number % prime == 0 }
      factor = -> { (number /= prime) && prime }
      a + E.generate_while(divisible, &factor)
    end
  end
end

module EnumerableExtensions
  E = EnumerableExtensions

  def reduce_until(predicate, a = nil)
    E.reduce_until(predicate, self, a, &Proc.new)
  end

  def self.generate_while(predicate)
    return enum_for(:generate_while, predicate) unless block_given?
    a = []
    loop do
      break unless predicate.call
      a << yield
    end
    a
  end

  def self.reduce_until(predicate, list, a = nil)
    return enum_for(:reduce_until, args) unless block_given?
    list.each_with_index do |e, i|
      break if predicate.call(a, e)
      a = (i > 0 || a) ? yield(a, e) : e
    end
    a
  end
end
