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

n = 1_000
limit = 10_000
stop = limit / 2
result1 = 0
result2 = 0
result3 = 0
result4 = 0
result5 = 0
Benchmark.bmbm do |x|
  x.report('inject_until') do
    n.times do
      result1 = EnumerableExtensions.inject_until(
        ->(_, e) { e > stop }, (0...limit), 0) do |a, e|
        a + e
      end
    end
  end

  x.report('reduce_until') do
    n.times do
      result2 = EnumerableExtensions.reduce_until(
        ->(_, e) { e > stop }, (0...limit), 0) do |a, e|
        a + e
      end
    end
  end

  x.report('reduce') do
    n.times do
      result3 = (0...limit).take_while { |e| e <= stop }
                .reduce(0) do |a, e|
        a + e
      end
    end
  end

  x.report('ext inject_until') do
    n.times do
      range = (0...limit).extend(EnumerableExtensions)
      result4 = range.inject_until(->(_, e) { e > stop }, 0) do |a, e|
        a + e
      end
    end
  end

  x.report('ext reduce_until') do
    n.times do
      range = (0...limit).extend(EnumerableExtensions)
      result5 = range.reduce_until(->(_, e) { e > stop }, 0) do |a, e|
        a + e
      end
    end
  end

  x.report('long hand') do
    n.times do
      result6 = 0
      (0...limit).each do |e|
        break if e > stop
        result6 += e
      end
    end
  end
end

puts "#{result1}"
puts "#{result2}"
puts "#{result3}"
puts "#{result4}"
puts "#{result5}"
puts "#{result6}"
