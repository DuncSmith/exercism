class Grains
  def self.square(number)
    Grains.new.square(number)
  end

  def self.total
    Grains.new.total
  end

  def initialize
    @squares = [0, 1]
  end

  def square(number)
    @squares[number] ||= 2 * square(number-1)
  end

  def total
    (1..64).map {|n| square n }.reduce(:+)
  end
end
