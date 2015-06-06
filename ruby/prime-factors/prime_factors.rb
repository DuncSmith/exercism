module PrimeFactors
  def self.for(number)
    divisors.each_with_object([]) do |d, factors|
      break factors if number == 1
      factors << number && (break factors) if Math.sqrt(number) < d
      factors << d && number /= d while number % d == 0
    end
  end

  class << self
    private

    def divisors
      return enum_for(:divisors) unless block_given?
      yield 2
      n = 1
      loop { yield n += 2 }
    end
  end
end
