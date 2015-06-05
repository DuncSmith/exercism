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
  
  def self.for_lh(number)
    factors = []
    Prime.each(number) do |prime|
      break if number < prime
      while number % prime == 0
        number /= prime
        factors << prime
      end
    end
    factors
  end
end

module EnumerableExtensions
  E = EnumerableExtensions

  def inject_until(predicate, a = nil)
    E.inject_until(predicate, self, a, &Proc.new)
  end

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

  def self.inject_until(predicate, list, a = nil)
    reduce_until(predicate, list, a, &Proc.new)
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

n = 10000
number = 901_255 # 93_819_012_551
result_ext = []
result_lh = []
Benchmark.bmbm do |x|
  x.report('ext') do
    n.times do
      result_ext = PrimeFactors.for(number)
    end
  end
  
  x.report('lh') do
    n.times do
      result_lh = PrimeFactors.for_lh(number)
    end
  end
end
puts "#{result_ext}"
puts "#{result_lh}"
