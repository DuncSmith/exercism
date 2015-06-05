require 'prime'

module PrimeFactors
  def self.for(number)
    factors = []
    Prime.each(number) do |prime|
      break if number == 1
      factors << number && break if Math.sqrt(number) < prime
      factors << prime && number /= prime while number % prime == 0
    end
    factors
  end
end
