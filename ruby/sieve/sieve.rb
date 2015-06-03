class Sieve
  def initialize(limit)
    @limit = limit
  end
  
  def primes
    @primes || find_primes
  end
  
  private
  
  attr_reader :limit
  
  def find_primes
    numbers = (2..limit).map { |n| [n, false] }
    prime = 2
    while prime
      remainder = numbers.drop(prime - 1)
      remainder.each do |n|
        next if n[1]
        n[1] = true if (n[0] % prime) == 0
      end
      prime = (remainder.find { |n, _| n > 0 } || [])[0]
    end
    numbers.reject { |_, marked| marked }.map { |n, _| n }
  end
end
