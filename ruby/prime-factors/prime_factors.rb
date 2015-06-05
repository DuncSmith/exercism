require 'prime'

module PrimeFactors
  def self.for(number)
    factors = []
    Prime.each(number) do |prime|
      break if number == 1
      factors << number && break if Math.sqrt(number) < prime
      (factors_for_prime, number) = factor_by_prime(number, prime)
      factors += factors_for_prime
    end
    factors
  end

  def self.factor_by_prime(number, prime)
    factors = []
    while number % prime == 0
      number /= prime
      factors << prime
    end
    [factors, number]
  end
end
